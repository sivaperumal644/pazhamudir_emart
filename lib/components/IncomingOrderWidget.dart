import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/constants/styles.dart';

class IncomingOrderWidget extends StatelessWidget {
  String orderNumber;
  String price;
  String address;
  String orderPlaced;
  IncomingOrderWidget(
      {Key key,
      String orderNumber,
      String price,
      String address,
      String orderPlaced})
      : super(key: key) {
    this.orderNumber = orderNumber;
    this.price = price;
    this.address = address;
    this.orderPlaced = orderPlaced;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PRIMARY_COLOR, width: 1),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                orderNumber,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  address,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    orderPlaced,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: PRIMARY_COLOR,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
