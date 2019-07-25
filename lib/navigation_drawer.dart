import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/screens/ShopDetailsScreens.dart';
import 'package:pazhamuthir_emart_service/screens/StaffScreen.dart';
import 'package:pazhamuthir_emart_service/screens/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appState.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
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
                  'Hi ' + appState.getUserName,
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StaffScreen()));
                },
                title: Text(
                  'STAFF',
                  style: TextStyle(fontSize: 16, color: WHITE_COLOR),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ListTile(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                },
                title: Text(
                  'LOG OUT',
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
