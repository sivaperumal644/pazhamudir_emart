import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart/components/InventoryListItemWidget.dart';
import 'package:pazhamuthir_emart/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/components/SearchWidget.dart';

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
              showModalBottomSheet(
                context: context, builder: (BuildContext context){
                  return ItemModalBottomSheet();
                }
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

class ItemModalBottomSheet extends StatelessWidget {
  const ItemModalBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: ListView(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                child: Icon(Icons.close),
              )),
          Text(
            'Add New Item',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: GREY_COLOR, width: 1)),
                      child: Icon(
                        Icons.add,
                        size: 80,
                        color: GREY_COLOR,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'ADD IMAGE',
                        style: TextStyle(color: GREEN_COLOR, fontSize: 14),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    itemTextField(context, 'Name', 1.7),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: itemTextField(context, 'category', 1.7),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Unit of measurement',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Radio(
                          groupValue: 1,
                          onChanged: (int value) {},
                          activeColor: PRIMARY_COLOR,
                          value: 1,
                        ),
                        Text(
                          'Kilogram (kg)',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          groupValue: 1,
                          onChanged: (int value) {},
                          activeColor: PRIMARY_COLOR,
                          value: 1,
                        ),
                        Text(
                          'Single Piece (unit)',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Price per kg',
                  style: TextStyle(fontSize: 18),
                ),
                itemTextField(context, 'Rupees/kg', 3)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Quantity in stock',
                  style: TextStyle(fontSize: 18),
                ),
                itemTextField(context, 'kg', 5),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: GREY_COLOR, width: 1)),
                  child: Icon(
                    Icons.remove,
                  ),
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: GREY_COLOR, width: 1)),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
          PrimaryButtonWidget(
            buttonText: 'SAVE CHANGES',
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Container itemTextField(BuildContext context, inputText, width) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width / width,
        color: Color.fromRGBO(0, 0, 0, 0.1),
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  labelText: inputText,
                  border: InputBorder.none),
            )));
  }
}
