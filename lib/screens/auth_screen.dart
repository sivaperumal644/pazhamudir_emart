import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pazhamuthir_emart/constants/colors.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text('Pazhamuthir',
                  style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
            child: Text('E-MART',
                style: TextStyle(
                    color: BLACK_COLOR,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text('SERVICE APP',
                  style: TextStyle(
                      fontSize: 16,
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0)),
            ),
          ),
          _bottomSheet(),
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: PRIMARY_COLOR,
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(40, 30, 40, 20),
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(
        children: <Widget>[
          Text('Sign in to your admin or delivery account',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: WHITE_COLOR,
                  fontSize: 24,
                  fontFamily: 'RaleWay',
                  fontWeight: FontWeight.bold)),
          _signinTextField(),
          _signinButton(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Text(
                  'Please contact admin to get your sign-in token.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: WHITE_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _signinTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: TextField(
        style: TextStyle(
            color: WHITE_COLOR,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: WHITE_COLOR)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: WHITE_COLOR)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: WHITE_COLOR)),
            hintStyle: TextStyle(
              color: WHITE_COLOR,
              fontFamily: 'Raleway',
              fontSize: 18,
            ),
            hintText: 'Sign in token'),
      ),
    );
  }

  Widget _signinButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 36.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
                width: 120,
                height: 36,
                child: RaisedButton(
                  color: WHITE_COLOR,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 2,
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 14,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500),
                  ),
                ))
          ]),
    );
  }
}
