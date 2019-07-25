import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/OrderDetailsWidget.dart';
import 'package:pazhamuthir_emart_service/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/getAllStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:provider/provider.dart';

import 'AssignStaffScreen.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  OrderDetailScreen({this.order});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: BLACK_COLOR),
        backgroundColor: WHITE_COLOR,
        title: Text(
          'Order ${order.orderNo}',
          style: TextStyle(color: BLACK_COLOR),
        ),
      ),
      body: Stack(children: <Widget>[
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Order',
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                  Text('#${order.orderNo}',
                      style: TextStyle(
                          color: GREY_COLOR,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: OrderDetailsWidget(
                order: order,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'REJECT THIS ORDER',
                style: TextStyle(
                    fontSize: 14,
                    color: RED_COLOR,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4),
              ),
            ),
            PrimaryButtonWidget(
                buttonText: 'ACCEPT ORDER',
                onPressed: () {
                  appState.setOrderId(order.id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StaffModalWidget()));
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return StaffModalWidget();
                  //     });
                })
          ],
        ),
      ]),
    );
  }
}
