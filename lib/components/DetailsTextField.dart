import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';

class DetailsTextField extends StatelessWidget {
  String inputText;
  TextEditingController controller;
  Function onTextChanged;
  DetailsTextField(
      {Key key, String inputText, this.controller, this.onTextChanged})
      : super(key: key) {
    this.inputText = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (String s) {
        onTextChanged();
      },
      style: TextStyle(
          color: BLACK_COLOR,
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
          counterText: validateForNotEmpty(controller.text),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: BLACK_COLOR)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: BLACK_COLOR)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: BLACK_COLOR)),
          labelStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            fontFamily: 'Raleway',
            fontSize: 18,
          ),
          labelText: inputText),
    );
  }

  validateForNotEmpty(String text) {
    if (text.isEmpty) {
      return 'Do not leave this empty';
    } else {
      return null;
    }
  }
}
