import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/components/IncomingOrderWidget.dart';
import 'package:pazhamuthir_emart/components/ServiceOrdersWidget.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 20.0),
              child: Text(
                'INCOMING NEW ORDER',
                style: TextStyle(
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: IncomingOrderWidget(
                  orderNumber: '#3459 (15 items)',
                  price: 'Rs. 5670',
                  address: 'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                  orderPlaced:
                      'Placed 23 minutes ago (3:45 PM, 28th July 2019)',
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 20.0),
              child: Text(
                'ORDERS UNDER SERVICE',
                style: TextStyle(
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ServiceOrdersWidget(
                orderNumber: '#3459 (15 items)',
                price: 'Rs. 5670',
                address: 'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                orderPlaced: 'Placed 23 minutes ago (3:45 PM, 28th July 2019)',
                statusOfDelivery: 'SENT FOR DELIVERY',
                deliveryIncharge:
                    'Delivery in-charge: Mr. Sivaram (9977875623)',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ServiceOrdersWidget(
                  orderNumber: '#3459 (15 items)',
                  price: 'Rs. 5670',
                  address: 'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                  orderPlaced:
                      'Placed 23 minutes ago (3:45 PM, 28th July 2019)',
                  statusOfDelivery: 'SENT FOR DELIVERY',
                  deliveryIncharge:
                      'Delivery in-charge: Mr. Sivaram (9977875623)'),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'VIEW ORDER HISTORY',
                style: TextStyle(color: BLACK_COLOR, fontSize: 14),
              ),
            ))
          ],
        ),
      ]),
    );
  }
}
