import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:pazhamuthir_emart/navigation_drawer.dart';

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
          children: <Widget>[ordersTab(), Text('')],
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

  Widget ordersTab() {
    return ListView(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 20.0),
            child: Text(
              'INCOMING NEW ORDER',
              style: TextStyle(
                  color: BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: incomingOrdersContainer(
                '#3459 (15 items)',
                'Rs. 5670',
                'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                'Placed 23 minutes ago (3:45 PM, 28th July 2019)'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 20.0),
            child: Text(
              'ORDERS UNDER SERVICE',
              style: TextStyle(
                  color: BLACK_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: serviceOrdersContainer(
                '#3459 (15 items)',
                'Rs. 5670',
                'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                'Placed 23 minutes ago (3:45 PM, 28th July 2019)',
                'Delivery in-charge: Mr. Sivaram (9977875623)'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: serviceOrdersContainer(
                '#3459 (15 items)',
                'Rs. 5670',
                'Mr. Vineesh, 10/672, Janata Nagar, Saravanampatti',
                'Placed 23 minutes ago (3:45 PM, 28th July 2019)',
                'Delivery in-charge: Mr. Sivaram (9977875623)'),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'VIEW ORDER HISTORY',
              style: TextStyle(color: BLACK_COLOR, fontSize: 14),
            ),
          ))
        ],
      ),
    ]);
  }

  Widget incomingOrdersContainer(orderNumber, price, address, orderPlaced) {
    return Container(
      decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: PRIMARY_COLOR, width: 1),
          boxShadow: [BoxShadow(color: SHADOW_COLOR, blurRadius: 20.0)]),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                orderNumber,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              address,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  orderPlaced,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: PRIMARY_COLOR,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget serviceOrdersContainer(
      orderNumber, price, address, orderPlaced, deliveryIncharge) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: GREY_COLOR, width: 1)),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                orderNumber,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    color: BLACK_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              address,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              orderPlaced,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'SENT FOR DELIVERY',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12, color: BLUE_COLOR),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(deliveryIncharge),
              ),
              Icon(
                Icons.arrow_forward,
                color: BLACK_COLOR,
              )
            ],
          )
        ],
      ),
    );
  }
}
