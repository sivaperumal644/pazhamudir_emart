import 'dart:convert';

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
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageSelectionWidget extends StatefulWidget {
  final String url;
  final Function(String base64Result) onUserImageSet;
  const ImageSelectionWidget({Key key, this.url, this.onUserImageSet})
      : super(key: key);

  @override
  _ImageSelectionWidgetState createState() => _ImageSelectionWidgetState();
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget> {
  pickImageFromGallery(ImageSource source) {
    return ImagePicker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: GREY_COLOR, width: 1)),
          child: Image.network('${widget.url}'),
        ),
        FlatButton(
          onPressed: handleNewImage,
          child: Text(
            'UPDATE IMAGE',
            style: TextStyle(
                color: GREEN_COLOR, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  void handleNewImage() async {
    File item = await pickImageFromGallery(ImageSource.gallery);
    List<int> fileAsBytes = await item.readAsBytes();
    String base64String = base64Encode(fileAsBytes);
    widget.onUserImageSet(base64String);
  }
}
