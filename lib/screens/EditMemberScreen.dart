import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/components/AppTitleWidget.dart';
import 'package:pazhamuthir_emart_service/components/DetailsTextField.dart';
import 'package:pazhamuthir_emart_service/components/SecondaryButtonWidget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/createStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/updateStaff_graphql.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../appState.dart';

class EditMemberDetailsScreen extends StatefulWidget {
  final StaffModel staff;
  final bool isNewEntry;
  const EditMemberDetailsScreen({Key key, this.staff, this.isNewEntry = false})
      : super(key: key);

  @override
  _EditMemberDetailsScreenState createState() =>
      _EditMemberDetailsScreenState();
}

class _EditMemberDetailsScreenState extends State<EditMemberDetailsScreen> {
  TextEditingController nameController, phoneNumberController;
  String tokenOnEdit;
  String accountTypeOnEdit;
  @override
  void initState() {
    super.initState();
    if (widget.isNewEntry == false) {
      nameController = TextEditingController(text: widget.staff.name);
      phoneNumberController =
          TextEditingController(text: widget.staff.phoneNumber);
      tokenOnEdit = widget.staff.token;
      accountTypeOnEdit = widget.staff.accountType;
    } else {
      nameController = TextEditingController();
      phoneNumberController = TextEditingController();
      tokenOnEdit = '';
      accountTypeOnEdit = 'DELIVERY_EXECUTIVE';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: AppTitleWidget(
              title: widget.isNewEntry ? 'Add new staff' : "Edit Staff Detail",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
            child: DetailsTextField(
              inputText: 'Name',
              controller: nameController,
              onTextChanged: generateToken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
            child: DetailsTextField(
              inputText: 'Phone Number',
              controller: phoneNumberController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 24.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: accountTypeOnEdit,
                      value: 'DELIVERY_EXECUTIVE',
                      activeColor: PRIMARY_COLOR,
                      onChanged: (String value) {
                        setState(() {
                          accountTypeOnEdit = value;
                        });
                      },
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
                      groupValue: accountTypeOnEdit,
                      value: 'SHOP_ADMIN',
                      activeColor: PRIMARY_COLOR,
                      onChanged: (String value) {
                        setState(() {
                          accountTypeOnEdit = value;
                        });
                      },
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
                  onPressed: generateToken,
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
              '$tokenOnEdit',
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
                widget.isNewEntry ? createStaffMutationComponent() : updateStaffMutationComponent()
              ],
            ),
          )
        ],
      ),
    );
  }

  void generateToken() {
    setState(() {
      if (nameController.text.isEmpty) {
        return '';
      }
      String temp = nameController.text.toUpperCase().replaceAll(' ', '');
      temp = '${temp}ABCDE';
      tokenOnEdit =
          '${temp.substring(0, 5)}${(Random().nextInt(10) + 1) * 12 + 10}';
    });
  }

  Widget createStaffMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(
        document: createStaffMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      onCompleted: (result) {},
      builder: (runMutation, result) {
        return SecondaryButtonWidget(
          buttonText: 'SAVE CHANGES',
          onPressed: () {
            runMutation({
              'name': nameController.text,
              'phoneNumber': phoneNumberController.text,
              'accountType': accountTypeOnEdit,
              'token': tokenOnEdit
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Widget updateStaffMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(
        document: updateStaffMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      onCompleted: (result) {},
      builder: (runMutation, result) {
        return SecondaryButtonWidget(
          buttonText: 'SAVE CHANGES',
          onPressed: () {
            runMutation({
              'name': nameController.text,
              'phoneNumber': phoneNumberController.text,
              'accountType': accountTypeOnEdit,
              'token': tokenOnEdit
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
