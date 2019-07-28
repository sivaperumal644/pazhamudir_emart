import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/InventoryListItemWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/components/SearchWidget.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/allInventory_graphql.dart';
import 'package:pazhamuthir_emart_service/model/InventoryItemModel.dart';
import 'package:pazhamuthir_emart_service/components/ItemModalBottomSheet.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InventoryScreenState();
  }
}

class InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Scaffold(
          body: _getInventoryQuery(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemModalBottomSheet(
                            isNewInventory: true,
                          )));
              // showModalBottomSheet(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return ItemModalBottomSheet();
              //     });
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
    return ListView.builder(
      itemCount: inventories.length + 1,
      itemBuilder: (context, index) {
        if (index == inventories.length) {
          return Container(
            height: 80,
          );
        }
        return itemContainer(inventories[index]);
      },
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
        pollInterval: 10,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading) return Center(child: CupertinoActivityIndicator());
        if (result.hasErrors)
          return Center(child: Text("Oops something went wrong"));
        if (result.data != null && result.data['getAllInventory'] != null) {
          List inventoryList = result.data['getAllInventory']['inventory'];
          final inventories = inventoryList
              .map((item) => InventoryItemModel.fromJson(item))
              .toList();
          return Container(
              margin: EdgeInsets.only(top: 100), child: itemsList(inventories));
        }
        return Container();
      },
    );
  }
}
