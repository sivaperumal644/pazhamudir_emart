import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart_service/components/OrderDetailsWidget.dart';
import 'package:pazhamuthir_emart_service/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderModel order;

  OrderDetailScreen({this.order});
  @override
  Widget build(BuildContext context) {
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
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StaffModalWidget();
                      });
                })
          ],
        ),
      ]),
    );
  }
}

class StaffModalWidget extends StatelessWidget {
  const StaffModalWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Assign Staff',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway'),
            ),
          ),
          Text('Please choose the delivery in-charge',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          staffWidget(),
          staffWidget(),
          staffWidget(),
          staffWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButtonWidget(
                    buttonText: 'Done',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }

  Padding staffWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: GREY_COLOR, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Kumar (8898976767)',
                        style: TextStyle(
                            color: BLACK_COLOR,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Text('Available',
                        style: TextStyle(fontSize: 14, color: GREEN_COLOR))
                  ],
                ),
              ),
              Radio(
                groupValue: 1,
                value: 1,
                activeColor: GREEN_COLOR,
                onChanged: (int value) {},
              )
            ],
          )),
    );
  }
}
