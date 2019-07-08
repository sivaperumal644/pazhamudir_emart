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
    return TextField(
      style: TextStyle(
          color: BLACK_COLOR,
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
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
}
