import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pazhamuthir_emart/components/AppTitleWidget.dart';
import 'package:pazhamuthir_emart/components/DetailsTextField.dart';
import 'package:pazhamuthir_emart/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

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
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.done,
                                  size: 90,
                                  color: GREEN_COLOR,
                                ),
                                Text(
                                  'Delivered',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: GREEN_COLOR,
                                      fontFamily: 'Raleway'),
                                )
                              ],
                            ),
                            content: Column(
                              children: <Widget>[
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: Text(
                                    'Please collect',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Rs. 4567',
                                    style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: GREEN_COLOR),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'from Mr.Vineesh',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SecondaryButtonWidget(
                                          buttonText: 'PAYMENT COLLECTED',
                                          onPressed: () {},
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'ORDER RETURNED TO STORE',
                                          style: TextStyle(color: GREEN_COLOR),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: OutlineButton(
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      12.0)),
                                          child: Text(
                                            'CALL STORE',
                                            style:
                                                TextStyle(color: GREEN_COLOR),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  )),
            )
          ],
        ));
  }
}
