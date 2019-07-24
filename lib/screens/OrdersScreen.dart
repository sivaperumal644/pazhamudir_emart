import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/components/IncomingOrderWidget.dart';
import 'package:pazhamuthir_emart_service/components/ServiceOrdersWidget.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/getAllOrders_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
import 'package:pazhamuthir_emart_service/model/AddressModel.dart';
import 'package:pazhamuthir_emart_service/model/CartItemModel.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:pazhamuthir_emart_service/screens/OrderDetailScreen.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrdersScreen> {
  OrderModel temporaryModel = OrderModel(
      staff: StaffModel(name: 'Sivaram', phoneNumber: '6969696969'),
      status: OrderStatuses.RECEIVED_BY_STORE,
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
      body: Column(
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
          serviceOrderWidget(),
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
    );
  }

  Padding serviceOrderWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: ServiceOrdersWidget(
        order: temporaryModel,
      ),
    );
  }

  Widget getAllOrderQueryComponent() {
    final appState = Provider.of<AppState>(context);
    return Query(
      options: QueryOptions(
        document: getAllOrderQuery,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
        pollInterval: 10,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading) return Center(child: CupertinoActivityIndicator());
        if (result.hasErrors)
          return Center(child: Text("Oops something went wrong"));
        if (result.data != null && result.data['getAllOrders'] != null) {
          List orderList = result.data['getAllOrders']['orders'];
          final orders =
              orderList.map((item) => OrderModel.fromJson(item)).toList();
          return Container(
            margin: EdgeInsets.only(top: 100),
          );
        }
        return Container();
      },
    );
  }
}
