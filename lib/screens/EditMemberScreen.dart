import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/components/AppTitleWidget.dart';
import 'package:pazhamuthir_emart/components/DetailsTextField.dart';
import 'package:pazhamuthir_emart/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class EditMemberDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: AppTitleWidget(
              title: "Edit Staff Detail",
            ),
          ),
          DetailsTextField(inputText: 'Name'),
          DetailsTextField(inputText: 'Phone Number'),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: 1,
                      value: 1,
                      activeColor: PRIMARY_COLOR,
                      onChanged: (int value) {},
                    ),
                    Text(
                      'Delivery Executive',
                      style: TextStyle(fontFamily: 'Ralewar', fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: 1,
                      value: 0,
                      activeColor: PRIMARY_COLOR,
                      onChanged: (int value) {},
                    ),
                    Text(
                      'Shop Admin',
                      style: TextStyle(fontFamily: 'Ralewar', fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'SIGN IN TOKEN',
                  style: TextStyle(fontSize: 14),
                ),
                OutlineButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0)),
                  child: Text(
                    'GENERATE',
                    style: TextStyle(color: GREEN_COLOR),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              'PER8867R',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 28.0, top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0)),
                  child: Text(
                    'REMOVE',
                    style: TextStyle(color: RED_COLOR),
                  ),
                ),
                SecondaryButtonWidget(
                  buttonText: 'SAVE CHANGES',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
