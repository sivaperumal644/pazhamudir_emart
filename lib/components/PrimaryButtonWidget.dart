import 'package:flutter/material.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'package:provider/provider.dart';

import '../appState.dart';

class PrimaryButtonWidget extends StatelessWidget {
  String buttonText;
  Function onPressed;

  PrimaryButtonWidget({Key key, String buttonText, Function onPressed})
      : super(key: key) {
    this.buttonText = buttonText;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
      child: RaisedButton(
        onPressed: onPressed,
        color: PRIMARY_COLOR,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 18, color: WHITE_COLOR),
          ),
        ),
      ),
    );
  }
}
