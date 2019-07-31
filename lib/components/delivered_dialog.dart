import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/components/secondary_button_widget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';

Future buildShowDialog(BuildContext context, OrderModel order,
    {RunMutation callback}) {
  return showDialog(
      context: context,
      child: AlertDialog(
        title: Column(
          children: <Widget>[
            Icon(
              Icons.done,
              size: 90,
              color: GREEN_COLOR,
            ),
            Text(
              'Delivered',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: GREEN_COLOR,
                  fontFamily: 'Raleway'),
            )
          ],
        ),
        content: Column(
          children: <Widget>[
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                'Please collect',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Rs. ${order.getTotalPrice()}',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: GREEN_COLOR),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'from ${order.address.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryButtonWidget(
                      buttonText: 'PAYMENT COLLECTED',
                      onPressed: () {
                        callback({
                          "status": OrderStatuses.DELIVERED_AND_PAID,
                          "orderId": order.id
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
