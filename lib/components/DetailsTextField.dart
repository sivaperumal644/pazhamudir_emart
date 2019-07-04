import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';

class DetailsTextField extends StatelessWidget {
  String inputText;
  DetailsTextField({
    Key key,
    String inputText,
  }) : super(key: key) {
    this.inputText = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 28.0, right: 28.0),
      child: TextField(
        style: TextStyle(
            color: BLACK_COLOR,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BLACK_COLOR)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BLACK_COLOR)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: BLACK_COLOR)),
            labelStyle: TextStyle(
              color: BLACK_COLOR,
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
            labelText: inputText),
      ),
    );
  }
}
