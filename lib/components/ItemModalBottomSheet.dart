import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/deleteInventory_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/new_inventory_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/updateInventory_graphql.dart';
import 'package:pazhamuthir_emart_service/model/InventoryItemModel.dart';
import 'package:provider/provider.dart';
import 'PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/ImageSelectionWidget.dart';

class ItemModalBottomSheet extends StatefulWidget {
  String id;
  String nameInput;
  String categoryInput;
  String unit;
  double priceInput;
  double quantityInput;
  InventoryItemModel inventory;
  bool isNewInventory = false;

  ItemModalBottomSheet(
      {Key key,
      String id,
      String nameInput,
      String categoryInput,
      String unit,
      double priceInput,
      double quantityInput,
      InventoryItemModel inventory,
      bool isNewInventory})
      : super(key: key) {
    this.id = id;
    this.nameInput = nameInput;
    this.categoryInput = categoryInput;
    this.unit = unit;
    this.priceInput = priceInput;
    this.quantityInput = quantityInput;
    this.inventory = inventory;
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
  TextEditingController nameController,
      categoryController,
      priceController,
      inStockController;
  String unitOnEdit;

  @override
  void initState() {
    super.initState();
    if (widget.isNewInventory) {
      nameController = TextEditingController();
      categoryController = TextEditingController();
      priceController = TextEditingController();
      inStockController = TextEditingController();
      unitOnEdit = 'kg';
    } else {
      nameController = TextEditingController(text: widget.inventory.name);
      categoryController =
          TextEditingController(text: widget.inventory.category);
      priceController =
          TextEditingController(text: widget.inventory.price.toString());
      inStockController =
          TextEditingController(text: widget.inventory.inStock.toString());
      unitOnEdit = widget.inventory.unit;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        children: <Widget>[
          Align(alignment: Alignment.topLeft, child: Icon(Icons.arrow_back)),
          Container(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.isNewInventory ? 'Add New Item' : 'Update Item',
              textAlign: TextAlign.left,
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
                new ImageSelectionWidget(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    itemTextField(context, 'Name', 1.7, 'name',
                        controller: nameController),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: itemTextField(context, 'category', 1.7, 'category',
                          controller: categoryController),
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
                          groupValue: unitOnEdit,
                          onChanged: (value) {
                            setState(() {
                              unitOnEdit = value;
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
                          groupValue: unitOnEdit,
                          onChanged: (value) {
                            setState(() {
                              unitOnEdit = value;
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
                  "Price per ${unitOnEdit == 'kg' ? 'kg' : 'unit'}",
                  style: TextStyle(fontSize: 18),
                ),
                itemTextField(context,
                    'Rupees/${unitOnEdit == 'kg' ? 'kg' : 'unit'}', 3, 'price',
                    isNumeric: true, controller: priceController)
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
                itemTextField(context, '${unitOnEdit == 'kg' ? 'kg' : 'unit'}',
                    3, 'inStock',
                    isNumeric: true, controller: inStockController),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16),
                child: widget.isNewInventory
                    ? Text('')
                    : deleteInventoryMutationComponent(),
              ),
              Expanded(
                child: widget.isNewInventory
                    ? inventoryMutationComponent()
                    : updateInventoryMutationComponent(),
              ),
            ],
          )
        ],
      ),
      //),
    );
  }

  Widget removeButton(RunMutation runMutation) {
    return OutlineButton(
      padding: EdgeInsets.all(16),
      child: Text('REMOVE',
          style: TextStyle(color: Colors.red, letterSpacing: 1.0)),
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
      onCompleted: (dynamic resultData) {
        Navigator.pop(context);
      },
    );
  }

  Widget updateInventoryMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(document: updateInventoryMutation, context: {
        'headers': <String, String>{
          'Authorization': 'Bearer ${appState.getJwtToken}',
        },
      }),
      builder: (runMutation, result) {
        print(result.errors);
        print(result.data);
        return saveChangesButton(runMutation);
      },
      update: (Cache cache, QueryResult result) {
        return cache;
      },
      onCompleted: (dynamic resultData) {
        print(resultData);
        Navigator.pop(context);
      },
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
      onPressed: isEverythingValidated()
          ? () {
              widget.isNewInventory
                  ? runMutation({
                      'name': nameController.text,
                      'price': double.parse(priceController.text),
                      'perUnit': 1,
                      'unit': unitOnEdit,
                      'category': categoryController.text,
                      'inStock': double.parse(inStockController.text)
                    })
                  : runMutation({
                      'inventoryId': widget.inventory.id,
                      'name': nameController.text,
                      'price': double.parse(priceController.text),
                      'perUnit': 1,
                      'unit': unitOnEdit,
                      'category': categoryController.text,
                      'inStock': double.parse(inStockController.text)
                    });
            }
          : null,
    );
  }

  Container itemTextField(BuildContext context, inputText, width, String type,
      {bool isNumeric = false, TextEditingController controller}) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width / width,
        color: Color.fromRGBO(0, 0, 0, 0.1),
        child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: controller,
              keyboardType:
                  isNumeric ? TextInputType.phone : TextInputType.text,
              onChanged: (val) {
                setState(() {
                  input[type] = val;
                });
              },
              decoration: InputDecoration(
                  errorText: validateForNotEmpty(controller.text),
                  labelStyle: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  labelText: inputText,
                  border: InputBorder.none),
            )));
  }

  bool isEverythingValidated() {
    return nameController.text.isNotEmpty &&
        categoryController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        inStockController.text.isNotEmpty;
  }

  validateForNotEmpty(String text) {
    if (text.isEmpty) {
      return 'Do not leave this empty';
    } else {
      return null;
    }
  }
}
