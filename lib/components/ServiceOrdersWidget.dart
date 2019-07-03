import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class ServiceOrdersWidget extends StatelessWidget {
  String orderNumber;
  String price;
  String address;
  String orderPlaced;
  String statusOfDelivery;
  String deliveryIncharge;
  ServiceOrdersWidget({
    Key key,
    String orderNumber,
    String price,
    String address,
    String orderPlaced,
    String statusOfDelivery,
    String deliveryIncharge,
  }) : super(key: key) {
    this.orderNumber = orderNumber;
    this.price = price;
    this.address = address;
    this.orderPlaced = orderPlaced;
    this.statusOfDelivery = statusOfDelivery;
    this.deliveryIncharge = deliveryIncharge;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: GREY_COLOR, width: 1)),
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              address,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              orderPlaced,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              statusOfDelivery,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: BLUE_COLOR),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  deliveryIncharge,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: BLACK_COLOR,
              )
            ],
          )
        ],
      ),
    );
  }
}
