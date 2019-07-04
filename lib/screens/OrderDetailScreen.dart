import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/components/OrderDetailsWidget.dart';
import 'package:pazhamuthir_emart/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class OrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: BLACK_COLOR),
        backgroundColor: WHITE_COLOR,
        title: Text(
          'Order 7439',
          style: TextStyle(color: BLACK_COLOR),
        ),
      ),
      body: ListView(
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
                Text('#3459',
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
            child: OrderDetailsWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'REJECT THIS ORDER',
              style: TextStyle(fontSize: 14, color: RED_COLOR),
            ),
          ),
          PrimaryButtonWidget(buttonText: 'ACCEPT ORDER')
        ],
      ),
    );
  }
}
