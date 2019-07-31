import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/navigation_drawer.dart';
import 'package:provider/provider.dart';
import '../appState.dart';
import 'order_screen.dart';

class HomeScreenForDelivery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenForDeliveryState();
  }
}

class HomeScreenForDeliveryState extends State<HomeScreenForDelivery> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: WHITE_COLOR,
        drawer: Navigation(),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: Text('Hi, ${appState.getUserName}'),
        ),
        body: OrdersScreen(),
      ),
    );
  }

  Widget tabBarComponents() {
    return TabBar(
      indicatorColor: WHITE_COLOR,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 5,
      tabs: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'ORDERS',
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'INVENTORY',
            style: TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
