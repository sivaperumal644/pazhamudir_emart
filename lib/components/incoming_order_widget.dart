import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';

class IncomingOrderWidget extends StatelessWidget {
  final OrderModel order;

  const IncomingOrderWidget({Key key, this.order}) : super(key: key);

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
                '#${order.orderNo} (${order.cartItems.length} items)',
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs. ${order.getTotalPrice().toString()}',
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
                  order.address.toString(),
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14),
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
                    order.datePlaced.toString(),
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
