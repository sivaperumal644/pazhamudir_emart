import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';

class ServiceOrdersWidget extends StatelessWidget {
  final OrderModel order;
  ServiceOrdersWidget({
    Key key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNew = order.status == OrderStatuses.PLACED_BY_CUST ? true : false;

    return Container(
      decoration: BoxDecoration(
          color: isNew ? PRIMARY_COLOR.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isNew ? Colors.amber : GREY_COLOR, width: isNew ? 2 : 1)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (isNew)
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        'NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 4, right: 4),
                    ),
                  Text(
                    '#${order.orderNo}',
                    style: TextStyle(
                        fontSize: 14,
                        color: BLACK_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              order.address.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              order.datePlaced.toString().substring(0, 19),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              StringResolver.getTextForOrderStatus(order.status),
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: isNew ? Colors.deepOrange : BLUE_COLOR),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  isNew
                      ? 'Staff not yet assigned'
                      : 'Delivery staff assigned: ${order.staff?.name} (${order.staff?.phoneNumber})',
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
