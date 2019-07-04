import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class StaffDetailsCard extends StatelessWidget {
  String staffName;
  String staffRole;
  String token;
  StaffDetailsCard({Key key, String staffName, String staffRole, String token})
      : super(key: key) {
    this.staffName = staffName;
    this.staffRole = staffRole;
    this.token = token;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  staffName,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: BLACK_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.edit)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                staffRole,
                style: TextStyle(
                    fontSize: 14,
                    color: GREEN_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                token,
                style: TextStyle(color: BLACK_COLOR, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
