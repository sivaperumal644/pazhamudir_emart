import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart_service/components/AppTitleWidget.dart';
import 'package:pazhamuthir_emart_service/components/DetailsTextField.dart';
import 'package:pazhamuthir_emart_service/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';

class ShopDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WHITE_COLOR,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: AppTitleWidget(
                  title: 'Shop Details',
                  subtitle:
                      'These details will be shown to the customer. The phone numbers for contact will be shown as customer support phone numbers.'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
              child: new DetailsTextField(
                inputText: 'Shop Name',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
              child: DetailsTextField(
                inputText: 'Address',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
              child: DetailsTextField(
                inputText: 'Shop Phone Number',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
              child: DetailsTextField(
                inputText: 'Alternate Phone Number',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, right: 24),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: new SecondaryButtonWidget(
                    buttonText: 'SAVE CHANGES',
                    onPressed: () {
                      //buildShowDialog(context);
                    },
                  )),
            )
          ],
        ));
  }

  
}
