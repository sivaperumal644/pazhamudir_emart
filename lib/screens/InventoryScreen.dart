import 'package:flutter/material.dart';
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
    return Column(
      children: <Widget>[SearchWidget(), itemContainer()],
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
            children: <Widget>[
              Text('Carrot'),
              Text('Rs. 30/kg')
            ],
          )
        ],
      ),
    );
  }
}
