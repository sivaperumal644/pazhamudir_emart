import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/components/AppTitleWidget.dart';
import 'package:pazhamuthir_emart/components/DetailsTextField.dart';
import 'package:pazhamuthir_emart/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class ShopDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: AppTitleWidget(
              title: 'Shop Details',
              subtitle:
                  'These details will be shown to the customer. The phone numbers for contact will be shown as customer support phone numbers.'),
        ),
        new DetailsTextField(
          inputText: 'Shop Name',
        ),
        DetailsTextField(
          inputText: 'Address',
        ),
        DetailsTextField(
          inputText: 'Shop Phone Number',
        ),
        DetailsTextField(
          inputText: 'Alternate Phone Number',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 48, right: 24),
          child: Align(
              alignment: Alignment.centerRight,
              child: new SecondaryButtonWidget(buttonText: 'SAVE CHANGES')),
        )
      ],
    ));
  }
}
