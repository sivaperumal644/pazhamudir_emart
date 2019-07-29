import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/appState.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/components/ServiceOrdersWidget.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/getAllOrders_graphql.dart';
import 'package:pazhamuthir_emart_service/screens/OrderDetailScreen.dart';
import 'package:pazhamuthir_emart_service/model/OrderModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final appState = Provider.of<AppState>(context);
    bool isDelivery = appState.getIsUserDelivery;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 20.0),
            child: Text(
              isDelivery ? 'ASSIGNED TO YOU' : 'ACTIVE ORDERS',
              style: TextStyle(
                  color: BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.0),
            ),
          ),
          getAllOrderQueryComponent(),
          Container(
            height: 30,
          )
        ],
      ),
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
          appState.setOrderId(order.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(
                        order: order,
                      )));
        },
        child: ServiceOrdersWidget(
          order: order,
        ),
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
        pollInterval: 3,
      ),
      builder: (QueryResult result, {VoidCallback refetch}) {
        if (result.loading) return Center(child: CupertinoActivityIndicator());
        if (result.hasErrors)
          return Center(child: Text("Oops something went wrong"));
        if (result.data != null && result.data['getAllOrders'] != null) {
          List orderList = result.data['getAllOrders']['orders'];
          final orders =
              orderList.map((item) => OrderModel.fromJson(item)).toList();
          // orders.sort((a,b){
          //   a.updatedDate.millisecondsSinceEpoch.compareTo(b.updatedDate.millisecondsSinceEpoch);
          // });
          if (appState.getIsUserDelivery) {
            var filteredList = orders.where((order) {
              return order.staff?.id == staffId;
            }).toList();
            return orderListComponent(filteredList);
          }
          return orderListComponent(orders);
        }
        return Container();
      },
    );
  }
}
