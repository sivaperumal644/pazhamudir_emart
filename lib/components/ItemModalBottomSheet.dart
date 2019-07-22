import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/constants/graphql/new_inventory_graphql.dart';
import 'package:provider/provider.dart';
import 'PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart/appState.dart';

class ItemModalBottomSheet extends StatefulWidget {
  String nameInput;
  String categoryInput;
  String unit;
  double priceInput;
  double quantityInput;
  String photoUrl;

  ItemModalBottomSheet(
      {Key key,
      String nameInput,
      String categoryInput,
      String unit,
      double priceInput,
      double quantityInput,
      String photoUrl})
      : super(key: key) {
    this.nameInput = nameInput;
    this.categoryInput = categoryInput;
    this.unit = unit;
    this.priceInput = priceInput;
    this.quantityInput = quantityInput;
    this.photoUrl = photoUrl;
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
    "unit": ""
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body:
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //       color: WHITE_COLOR,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          //   child:
          ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Add New Item',
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
                  'Price per kg',
                  style: TextStyle(fontSize: 18),
                ),
                itemTextField(context, 'Rupees/kg', 3, 'price')
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
                itemTextField(context, 'kg', 5, 'inStock'),
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
          inventoryMutationComponent()
        ],
      ),
      //),
    );
  }

  Widget inventoryMutationComponent() {
    final appState = Provider.of<AppState>(context);
    print(appState.getJwtToken);
    return Mutation(
      options: MutationOptions(document: newInventoryMutation, context: {
        'headers': <String, String>{
          'Authorization': 'Bearer ${appState.getJwtToken}',
        },
      }),
      builder: (runMutation, result) {
        print(result.errors);
        return saveChangesButton(runMutation);
      },
      update: (Cache cache, QueryResult result) {
        return cache;
      },
      onCompleted: (dynamic resultData) {
        print(resultData.toString());
      },
    );
  }

  Widget saveChangesButton(RunMutation runMutation) {
    return PrimaryButtonWidget(
      buttonText: 'SAVE CHANGES',
      onPressed: () {
        runMutation({
          'name': input['name'],
          'price': double.parse(input['price']),
          'perUnit': 1,
          'unit': input['unit'],
          'category': input['category'],
          'inStock': double.parse(input['inStock'])
        });
      },
    );
  }

  Container itemTextField(BuildContext context, inputText, width, String type) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width / width,
        color: Color.fromRGBO(0, 0, 0, 0.1),
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
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
