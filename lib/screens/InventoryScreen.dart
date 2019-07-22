import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart/components/InventoryListItemWidget.dart';
import 'package:pazhamuthir_emart/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/components/SearchWidget.dart';
import 'package:pazhamuthir_emart/constants/graphql/new_inventory_graphql.dart';
import 'package:pazhamuthir_emart/model/InventoryItemModel.dart';
import 'package:pazhamuthir_emart/components/ItemModalBottomSheet.dart';

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
          body: itemsList(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemModalBottomSheet()));
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

  Widget itemsList() {
    return ListView(
      children: <Widget>[
        Container(
          height: 100,
        ),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
        InventoryItemWidget(),
      ],
    );
  }

  Widget itemContainer() {
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/carrot.png',
            width: 52,
            height: 52,
          ),
          Column(
            children: <Widget>[Text('Carrot'), Text('Rs. 30/kg')],
          )
        ],
      ),
    );
  }
}

