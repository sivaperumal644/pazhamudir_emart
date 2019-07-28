import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/deleteInventory_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/new_inventory_graphql.dart';
import 'package:provider/provider.dart';
import 'PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/appState.dart';

class ItemModalBottomSheet extends StatefulWidget {
  String id;
  String nameInput;
  String categoryInput;
  String unit;
  double priceInput;
  double quantityInput;
  String photoUrl;
  bool isNewInventory = false;

  ItemModalBottomSheet(
      {Key key,
      String id,
      String nameInput,
      String categoryInput,
      String unit,
      double priceInput,
      double quantityInput,
      String photoUrl,
      bool isNewInventory})
      : super(key: key) {
    this.id = id;
    this.nameInput = nameInput;
    this.categoryInput = categoryInput;
    this.unit = unit;
    this.priceInput = priceInput;
    this.quantityInput = quantityInput;
    this.photoUrl = photoUrl;
    this.isNewInventory = isNewInventory;
  }

  @override
  _ItemModalBottomSheetState createState() => _ItemModalBottomSheetState();
}

class _ItemModalBottomSheetState extends State<ItemModalBottomSheet> {
  Map<String, dynamic> input = {
    "name": "",
    "category": "",
    "price": "",
    "inStock": "",
    "unit": "kg"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        children: <Widget>[
          Container(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.isNewInventory ? 'Add New Item' : 'Update Item',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
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
                    itemTextField(context, 'Name', 1.7, 'name'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child:
                          itemTextField(context, 'category', 1.7, 'category'),
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
                          groupValue: input['unit'],
                          onChanged: (value) {
                            setState(() {
                              input['unit'] = value;
                            });
                          },
                          activeColor: PRIMARY_COLOR,
                          value: "kg",
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
                          groupValue: input['unit'],
                          onChanged: (value) {
                            setState(() {
                              input['unit'] = value;
                            });
                          },
                          activeColor: PRIMARY_COLOR,
                          value: "unit",
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
                  "Price per ${input['unit'] == 'kg' ? 'kg' : 'unit'}",
                  style: TextStyle(fontSize: 18),
                ),
                itemTextField(
                    context,
                    'Rupees/${input['unit'] == 'kg' ? 'kg' : 'unit'}',
                    3,
                    'price',
                    isNumeric: true)
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
                itemTextField(context,
                    '${input['unit'] == 'kg' ? 'kg' : 'unit'}', 3, 'inStock',
                    isNumeric: true),
              ],
            ),
          ),
          inventoryMutationComponent(),
          widget.isNewInventory ? Text('') : deleteInventoryMutationComponent()
        ],
      ),
      //),
    );
  }

  Widget removeButton(RunMutation runMutation) {
    return OutlineButton(
      child: Text('remove'),
      onPressed: () {
        runMutation({'inventoryId': widget.id});
      },
    );
  }

  Widget inventoryMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(document: newInventoryMutation, context: {
        'headers': <String, String>{
          'Authorization': 'Bearer ${appState.getJwtToken}',
        },
      }),
      builder: (runMutation, result) {
        return saveChangesButton(runMutation);
      },
      update: (Cache cache, QueryResult result) {
        return cache;
      },
      onCompleted: (dynamic resultData) {},
    );
  }

  Widget deleteInventoryMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(document: deleteInventoryMutation, context: {
        'headers': <String, String>{
          'Authorization': 'Bearer ${appState.getJwtToken}',
        },
      }),
      builder: (runMutation, result) {
        return removeButton(runMutation);
      },
      update: (Cache cache, QueryResult result) {
        return cache;
      },
      onCompleted: (dynamic resultData) {
        Navigator.pop(context);
      },
    );
  }

  Widget saveChangesButton(RunMutation runMutation) {
    return PrimaryButtonWidget(
      buttonText: widget.isNewInventory ? 'ADD ITEM' : 'SAVE CHANGES',
      onPressed: () {
        runMutation({
          'name': input['name'],
          'price': double.parse(input['price']),
          'perUnit': 1,
          'unit': input['unit'],
          'category': input['category'],
          'inStock': double.parse(input['inStock'])
        });
        Navigator.pop(context);
      },
    );
  }

  Container itemTextField(BuildContext context, inputText, width, String type,
      {bool isNumeric = false}) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width / width,
        color: Color.fromRGBO(0, 0, 0, 0.1),
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              keyboardType:
                  isNumeric ? TextInputType.phone : TextInputType.text,
              onChanged: (val) {
                setState(() {
                  input[type] = val;
                });
              },
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  labelText: inputText,
                  border: InputBorder.none),
            )));
  }
}
