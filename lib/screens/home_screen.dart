import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/navigation_drawer.dart';
import 'inventory_screen.dart';
import 'order_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: WHITE_COLOR,
        drawer: Navigation(),
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: Text('Pazhamuthir Service App'),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                padding: EdgeInsets.only(top: 20),
                height: 60,
                color: PRIMARY_COLOR,
                child: tabBarComponents(),
              )),
        ),
        body: TabBarView(
          physics: FixedExtentScrollPhysics(),
          children: <Widget>[OrdersScreen(), InventoryScreen()],
        ),
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
