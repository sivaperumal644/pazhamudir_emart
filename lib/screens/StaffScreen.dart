import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/components/StaffDetailsCard.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'EditMemberScreen.dart';

class StaffScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 54),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 16, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Staff',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'RaleWay',
                          fontWeight: FontWeight.bold)),
                  OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0)),
                    child: Text(
                      'ADD',
                      style: TextStyle(color: GREEN_COLOR),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
                child: StaffDetailsCard(
                  staffName: 'Mr. Siva, 9988776677',
                  staffRole: 'DELIVERY EXECUTIVE',
                  token: 'Sign in Token: PER8817A',
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
              child: StaffDetailsCard(
                staffName: 'Mr. Siva, 9988776677',
                staffRole: 'DELIVERY EXECUTIVE',
                token: 'Sign in Token: PER8817A',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
              child: StaffDetailsCard(
                staffName: 'Mr. Siva, 9988776677',
                staffRole: 'DELIVERY EXECUTIVE',
                token: 'Sign in Token: PER8817A',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
              child: StaffDetailsCard(
                staffName: 'Mr. Siva, 9988776677',
                staffRole: 'DELIVERY EXECUTIVE',
                token: 'Sign in Token: PER8817A',
              ),
            )
          ],
        ),
        ],
      ),
    );
  }
}

