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
  String imageAsBase64 = '';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE_COLOR,
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 16,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
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
                padding: const EdgeInsets.only(top: 24.0),
                child: new ImageSelectionWidget(
                  onUserImageSet: (base64) {
                    setState(() {
                      print("RETURNED FROM IMAGE PICKER $base64");
                      imageAsBase64 = base64;
                    });
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  itemTextField(context, 'Name', 1.7, 'name',
                      controller: nameController),
                  itemTextField(context, 'Category', 1.7, 'Category',
                      controller: categoryController),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(),
                  ),
                  Text(
                    'Unit of measurement',
                    style: TextStyle(
                        fontSize: 14,
                        color: GREY_COLOR,
                        fontWeight: FontWeight.w500),
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(),
                  ),
                  Text(
                    "Price per ${unitOnEdit == 'kg' ? 'kg' : 'unit'}",
                    style: TextStyle(
                        fontSize: 14,
                        color: GREY_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                  itemTextField(
                      context,
                      'Rupees/${unitOnEdit == 'kg' ? 'kg' : 'unit'}',
                      3,
                      'price',
                      isNumeric: true,
                      controller: priceController),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Divider(),
                  ),
                  Text(
                    'Quantity in stock',
                    style: TextStyle(
                        fontSize: 14,
                        color: GREY_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                  itemTextField(
                      context,
                      '${unitOnEdit == 'kg' ? 'kg' : 'unit'} (in stock)',
                      3,
                      'inStock',
                      isNumeric: true,
                      controller: inStockController),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: widget.isNewInventory
                        ? Text('')
                        : deleteInventoryMutationComponent(),
                  ),
                  Spacer(),
                  widget.isNewInventory
                      ? inventoryMutationComponent()
                      : updateInventoryMutationComponent(),
                ],
              )
            ],
          ),
        ),
        //),
      ),
    );
  }

  Widget removeButton(RunMutation runMutation) {
    return IconButton(
      tooltip: 'Delete item',
      icon: Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
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
                      'inStock': double.parse(inStockController.text),
                      'imageString': imageAsBase64
                    })
                  : runMutation({
                      'inventoryId': widget.inventory.id,
                      'name': nameController.text,
                      'price': double.parse(priceController.text),
                      'perUnit': 1,
                      'unit': unitOnEdit,
                      'category': categoryController.text,
                      'inStock': double.parse(inStockController.text),
                      'imageString': imageAsBase64
                    });
            }
          : null,
    );
  }

  Container itemTextField(BuildContext context, inputText, width, String type,
      {bool isNumeric = false, TextEditingController controller}) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextField(
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
                  labelText: inputText),
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
