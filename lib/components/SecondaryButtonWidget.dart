import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart_service/constants/colors.dart';

class SecondaryButtonWidget extends StatelessWidget {
  String buttonText;
  Function onPressed;
  SecondaryButtonWidget({Key key, String buttonText, Function onPressed})
      : super(key: key) {
    this.buttonText = buttonText;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: GREEN_COLOR,
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 24.0, right: 24.0, top: 14.0, bottom: 14.0),
        child: Text(
          buttonText,
          style: TextStyle(color: WHITE_COLOR, fontSize: 14),
        ),
      ),
    );
  }
}
