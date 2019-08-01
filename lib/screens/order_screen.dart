import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/components/service_order_widget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/get_all_orders.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'order_details_screen.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrdersScreen> {
  String staffId = '';
  @override
  void initState() {
    super.initState();
    getId();
  }

  getId() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String id = sharedPref.getString('staffId');
    setState(() {
      staffId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getAllOrderQueryComponent(),
    );
  }

  ListView orderListComponent(List<OrderModel> orders) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) => serviceOrderWidget(orders[index]),
    );
  }

  Padding serviceOrderWidget(OrderModel order) {
    final appState = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: InkWell(
        onTap: () {
          appState.setIsStaffAssignedSelected(false);
          appState.setOrderId(order.id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(
                order: order,
              ),
            ),
          );
        },
        child: ServiceOrdersWidget(
          order: order,
        ),
      ),
    );
  }

  Widget getAllOrderQueryComponent() {
    final appState = Provider.of<AppState>(context);
    bool isDelivery = appState.getIsUserDelivery;
    List orderList = [];
    return Query(
      options: QueryOptions(
        document: getAllOrderQuery,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
        pollInterval: 3,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading)
          return Center(
            child: CupertinoActivityIndicator(),
          );
        if (result.hasErrors)
          return Center(
            child: Text("Oops something went wrong"),
          );
        if (result.data != null && result.data['getAllOrders'] != null) {
          List orderList = result.data['getAllOrders']['orders'];
          final orders =
              orderList.map((item) => OrderModel.fromJson(item)).toList();
          List incomingOrders = orders
              .where((item) =>
                  StringResolver.getTextForOrderStatus(item.status)
                      .toString() ==
                  "INCOMING ORDER")
              .toList();
          List activeOrders = orders
              .where((item) =>
                  StringResolver.getTextForOrderStatus(item.status)
                      .toString() !=
                  "INCOMING ORDER")
              .toList();
          if (appState.getIsUserDelivery) {
            var filteredList = orders.where((order) {
              return order.staff?.id == staffId;
            }).toList();
            return mainList(isDelivery, filteredList, []);
          }
          return mainList(isDelivery, incomingOrders, activeOrders);
        }
        return Container();
      },
    );
  }

  ListView mainList(bool isDelivery, List incomingOrders, List activeOrders) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 20.0),
          child: Text(
            isDelivery ? 'ASSIGNED TO YOU' : 'INCOMING ORDER',
            style: TextStyle(
                color: BLACK_COLOR,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.0),
          ),
        ),
        incomingOrders.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: isDelivery
                      ? Text('No orders found for you.')
                      : Text('No Incoming orders right now'),
                ),
              )
            : orderListComponent(incomingOrders),
        if (!isDelivery) ...[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 20.0),
            child: Text(
              'ACTIVE ORDERS',
              style: TextStyle(
                  color: BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.0),
            ),
          ),
          activeOrders.isEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text('No active orders right now'),
                ))
              : orderListComponent(activeOrders),
        ],
        Container(
          height: 30,
        )
      ],
    );
  }
}
