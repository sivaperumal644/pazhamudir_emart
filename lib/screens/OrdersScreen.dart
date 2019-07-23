import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/components/IncomingOrderWidget.dart';
import 'package:pazhamuthir_emart_service/components/ServiceOrdersWidget.dart';
import 'package:pazhamuthir_emart_service/model/AddressModel.dart';
import 'package:pazhamuthir_emart_service/model/CartItemModel.dart';
import 'package:pazhamuthir_emart_service/screens/OrderDetailScreen.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrdersScreen> {
  OrderModel temporaryModel = OrderModel(
      id: 'SDE2424',
      address: AddressModel(
          name: 'Vineesh',
          addressLine:
              'EEEWE Street, 23 Avenue, Parkour Road, Winner Winner Chicken Dinner Nagar Uwu',
          landmark: 'Behind Building',
          phoneNumber: '8899889988'),
      orderNo: '33423',
      datePlaced: DateTime.now(),
      cartItems: [
        CartItemModel(name: 'Apple', perUnitPrice: 30, unit: 'kg', price: 300)
      ]);

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
                'INCOMING NEW ORDERS',
                style: TextStyle(
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.0),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetailScreen(
                                  order: temporaryModel,
                                )));
                  },
                  child: IncomingOrderWidget(
                    order: temporaryModel,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 20.0),
              child: Text(
                'ORDERS UNDER SERVICE',
                style: TextStyle(
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
            Container(
              height: 24,
            ),
            Center(
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'VIEW ORDER HISTORY',
                      style: TextStyle(
                          color: BLACK_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0),
                    ))),
            Container(
              height: 24,
            )
          ],
        ),
      ]),
    );
  }
}
