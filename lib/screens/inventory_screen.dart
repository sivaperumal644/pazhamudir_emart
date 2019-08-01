import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/inventory_list_item.dart';
import 'package:pazhamuthir_emart_service/components/search_widget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/get_all_inventory.dart';
import 'package:pazhamuthir_emart_service/model/InventoryItemModel.dart';
import 'package:pazhamuthir_emart_service/screens/order_screen.dart';
import 'package:pazhamuthir_emart_service/components/NetworkOfflineWidget.dart';

import 'package:provider/provider.dart';

import 'edit_inventory_screen.dart';

class InventoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InventoryScreenState();
  }
}

class InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Scaffold(
          body: _getInventoryQuery(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              appState.setIsStaffAssignedSelected(false);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemModalBottomSheet(
                    isNewInventory: true,
                  ),
                ),
              );
            },
            label: Text(
              'NEW ITEM',
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500),
            ),
            icon: Icon(Icons.add),
            backgroundColor: PRIMARY_COLOR,
          ),
        ),
        SearchWidget(),
      ],
    );
  }

  Widget itemsList(List<InventoryItemModel> inventories) {
    return inventories.isEmpty
        ? Center(
            child: Text(
            'There are no items in the inventory'.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey.shade400),
          ))
        : ListView(
            children: <Widget>[
              Container(
                height: 80,
              ),
              ...inventories.map(
                (model) => itemContainer(model),
              ),
              Container(
                height: 80,
              )
            ],
          );
  }

  Widget itemContainer(InventoryItemModel inventory) {
    final appState = Provider.of<AppState>(context);
    return InventoryItemWidget(
      id: inventory.id,
      name: inventory.name,
      price: inventory.price,
      unit: inventory.unit,
      inStock: inventory.inStock,
      searchText: appState.getSearchText,
      inventory: inventory,
    );
  }

  Widget _getInventoryQuery() {
    final appState = Provider.of<AppState>(context);
    return Query(
      options: QueryOptions(
        document: getAllInventory,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
        pollInterval: 30,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading)
          return Center(
            child: CupertinoActivityIndicator(),
          );
        if (result.hasErrors)
          return NetworkErrorIndicatorWidget(
            refetch: refetch,
          );
        if (result.data != null &&
            result.data['getAllInventory']['inventory'] != null) {
          List inventoryList = result.data['getAllInventory']['inventory'];
          inventoryList.sort((a, b) {
            return a['name'].toLowerCase().compareTo(b['name'].toLowerCase());
          });
          final inventories = inventoryList
              .map((item) => InventoryItemModel.fromJson(item))
              .toList();
          return Container(child: itemsList(inventories));
        }
        return Container();
      },
    );
  }
}
