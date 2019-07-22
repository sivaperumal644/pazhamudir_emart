import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  AppState() {
    getFromMemory();
  }

  bool isOrderAccepted = false;
  String jwtToken = "";

  void setIsOrderAccepted(bool text) {
    isOrderAccepted = text;
    notifyListeners();
  }

  Future getFromMemory() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token") ?? "";
    jwtToken = token;
  }

  void setJwtToken(String text) {
    jwtToken = text;
    notifyListeners();
  }

  get getJwtToken => jwtToken;
  get getIsOrderAccepted => isOrderAccepted;
}
