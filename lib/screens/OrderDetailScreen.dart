import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/DeliveredDialog.dart';
import 'package:pazhamuthir_emart_service/components/OrderDetailsWidget.dart';
import 'package:pazhamuthir_emart_service/components/PrimaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/changeOrderStatus_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:provider/provider.dart';

import 'AssignStaffScreen.dart';

class OrderDetailScreen extends StatefulWidget {
  final OrderModel order;

  OrderDetailScreen({this.order});

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: AppBar(
        iconTheme: IconThemeData(color: BLACK_COLOR),
        backgroundColor: WHITE_COLOR,
        title: Text(
          'Order ${widget.order.orderNo}',
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
                    (widget.order.status == OrderStatuses.RECEIVED_BY_STORE)
                        ? 'New Order'
                        : 'Order',
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                  Text('#${widget.order.orderNo}',
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
                order: widget.order,
              ),
            ),
            if (!appState.isUserDelivery)
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: cancelOrderMutation(),
              ),
            if (!appState.isUserDelivery)
              PrimaryButtonWidget(
                  buttonText: 'ACCEPT ORDER',
                  onPressed: () {
                    appState.setOrderId(widget.order.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StaffModalWidget()));
                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return StaffModalWidget();
                    //     });
                  }),
            if (appState.isUserDelivery) resolveDeliveryButtons()
          ],
        ),
      ]),
    );
  }

  Widget rejectButton(RunMutation runMutation) {
    return FlatButton(
      onPressed: () {
        runMutation({
          'status': OrderStatuses.CANCELLED_BY_STORE,
          'orderId': widget.order.id
        });
      },
      child: Text(
        'REJECT THIS ORDER',
        style: TextStyle(
            fontSize: 14,
            color: RED_COLOR,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4),
      ),
    );
  }

  Widget changeOrderStatusButton(RunMutation runMutation, String status,
      {String title}) {
    return PrimaryButtonWidget(
      buttonText: '$title',
      onPressed: () {
        runMutation({"status": status, "orderId": widget.order.id});
      },
    );
  }

  Widget cancelOrderMutation() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      onCompleted: (something) {
        Navigator.pop(context);
      },
      options: MutationOptions(
        document: changeOrderStatusMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      builder: (runMutation, result) {
        print(result.data);
        print(result.errors);
        return rejectButton(runMutation);
      },
    );
  }

  changeStatusMutation(String status, {String title}) {
    final appState = Provider.of<AppState>(context);

    return Mutation(
      options: MutationOptions(
        document: changeOrderStatusMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      builder: (runMutation, result) {
        print(result.data);
        print(result.errors);
        if (status == OrderStatuses.DELIVERED_AND_PAID) {
          return PrimaryButtonWidget(
            buttonText: 'MARK ORDER DELIVERED',
            onPressed: () {
              buildShowDialog(context, widget.order, callback: runMutation);
            },
          );
        } else
          return changeOrderStatusButton(runMutation, status, title: title);
      },
    );
  }

  resolveDeliveryButtons() {
    switch (widget.order.status) {
      case OrderStatuses.RECEIVED_BY_STORE:
        return changeStatusMutation(OrderStatuses.PICKED_UP,
            title: 'MARK ORDER PICKED UP');
      case OrderStatuses.PICKED_UP:
        return changeStatusMutation(OrderStatuses.DELIVERED_AND_PAID,
            title: 'MARK ORDER COMPLETE');
      default:
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'No actions available now.',
            style: TextStyle(color: GREY_COLOR),
          ),
        ));
    }
  }
}
