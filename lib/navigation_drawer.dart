import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: PRIMARY_COLOR,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pazhamuthir',
                    style: TextStyle(
                        color: WHITE_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 38),
                  ),
                  Text(
                    'E-MART SERVICE APP',
                    style: TextStyle(color: WHITE_COLOR, fontSize: 12),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                title: Text(
                  'Hi, Sivaram',
                  style: TextStyle(color: WHITE_COLOR, fontSize: 24),
                ),
              ),
            ),
            ListTile(
                title: Text(
              'NAVIGATION',
              textAlign: TextAlign.center,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text(
                  'ORDERS',
                  style: TextStyle(fontSize: 16, color: WHITE_COLOR),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text(
                  'INVENTORY',
                  style: TextStyle(fontSize: 16, color: WHITE_COLOR),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text(
                  'SHOP DETAILS',
                  style: TextStyle(fontSize: 16, color: WHITE_COLOR),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListTile(
                title: Text(
                  'STAFF',
                  style: TextStyle(fontSize: 16, color: WHITE_COLOR),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
