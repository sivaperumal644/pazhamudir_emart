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

class ImageSelectionWidget extends StatelessWidget {
  final String url;
  const ImageSelectionWidget({
    Key key,
    this.url,
  }) : super(key: key);

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
          child: Image.network('$url'),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            'UPDATE IMAGE',
            style: TextStyle(
                color: GREEN_COLOR, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
