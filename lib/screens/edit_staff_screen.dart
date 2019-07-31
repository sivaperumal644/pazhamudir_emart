import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pazhamuthir_emart_service/components/app_title_widget.dart';
import 'package:pazhamuthir_emart_service/components/confirm_dialog_action.dart';
import 'package:pazhamuthir_emart_service/components/details_text_field.dart';
import 'package:pazhamuthir_emart_service/components/secondary_button_widget.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/create_staff.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/disable_staff.dart';
import 'package:pazhamuthir_emart_service/constants/graphql/update_staff.dart';
import 'package:pazhamuthir_emart_service/constants/strings.dart';
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
  String id;
  @override
  void initState() {
    super.initState();
    if (widget.isNewEntry == false) {
      id = widget.staff.id;
      nameController = TextEditingController(text: widget.staff.name);
      phoneNumberController =
          TextEditingController(text: widget.staff.phoneNumber);
      tokenOnEdit = widget.staff.token;
      accountTypeOnEdit = widget.staff.accountType;
    } else {
      nameController = TextEditingController();
      phoneNumberController = TextEditingController();
      tokenOnEdit = '';
      accountTypeOnEdit = AccountTypes.DELIVERY;
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
                      value: AccountTypes.DELIVERY,
                      activeColor: PRIMARY_COLOR,
                      onChanged: (String value) {
                        setState(() {
                          accountTypeOnEdit = value;
                        });
                      },
                    ),
                    Text(
                      'Delivery Executive',
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      groupValue: accountTypeOnEdit,
                      value: AccountTypes.STORE_ADMIN,
                      activeColor: PRIMARY_COLOR,
                      onChanged: (String value) {
                        setState(() {
                          accountTypeOnEdit = value;
                        });
                      },
                    ),
                    Text(
                      'Shop Admin',
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 28, top: 10),
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
            padding: const EdgeInsets.only(
                left: 32.0, right: 28.0, top: 32.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.isNewEntry ? Text('') : disableStaffMutationComponent(),
                widget.isNewEntry
                    ? createStaffMutationComponent('ADD STAFF')
                    : updateStaffMutationComponent('SAVE CHANGES')
              ],
            ),
          )
        ],
      ),
    );
  }

  OutlineButton removeButton(RunMutation runMutation) {
    return OutlineButton(
      onPressed: () {
        showConfirmHarmfulActionDialog(
            title: 'Confirm delete staff',
            context: context,
            content:
                'Are you sure you want to delete this staff member. You cannot undo this operation.',
            runMutation: runMutation,
            runMutationData: {'staffId': id});
      },
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0)),
      child: Text(
        'REMOVE',
        style: TextStyle(color: RED_COLOR),
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

  Widget createStaffMutationComponent(String inputText) {
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
          buttonText: inputText,
          onPressed: isEverythingValidated()
              ? () {
                  runMutation({
                    'name': nameController.text,
                    'phoneNumber': phoneNumberController.text,
                    'accountType': accountTypeOnEdit,
                    'token': tokenOnEdit
                  });
                  Navigator.pop(context);
                }
              : null,
        );
      },
    );
  }

  Widget updateStaffMutationComponent(String inputText) {
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
      onCompleted: (result) {
        Navigator.pop(context);
      },
      builder: (runMutation, result) {
        return SecondaryButtonWidget(
          buttonText: inputText,
          onPressed: () {
            appState.setIsStaffAssignedSelected(true);
            runMutation({
              'staffId': id,
              'name': nameController.text,
              'phoneNumber': phoneNumberController.text,
              'accountType': accountTypeOnEdit,
              'token': tokenOnEdit
            });
          },
        );
      },
    );
  }

  Widget disableStaffMutationComponent() {
    final appState = Provider.of<AppState>(context);
    return Mutation(
      options: MutationOptions(
        document: disableStaffMutation,
        context: {
          'headers': <String, String>{
            'Authorization': 'Bearer ${appState.getJwtToken}',
          },
        },
      ),
      onCompleted: (result) {
        Navigator.pop(context);
      },
      builder: (runMutation, result) {
        return removeButton(runMutation);
      },
    );
  }

  bool isEverythingValidated() {
    return nameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty;
  }
}
