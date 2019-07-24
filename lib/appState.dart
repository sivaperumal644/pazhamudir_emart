import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  AppState() {
    getFromMemory();
  }

  bool isOrderAccepted = false;
  String jwtToken = "";
  String searchText = "";
  String userName = "";

  void setIsOrderAccepted(bool text) {
    isOrderAccepted = text;
    notifyListeners();
  }

  Future getFromMemory() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token") ?? "";
    final name = pref.getString("name") ?? "";
    jwtToken = token;
    userName = name;
  }

  void setJwtToken(String text) {
    jwtToken = text;
    notifyListeners();
  }

  void setSearchText(String text) {
    searchText = text;
    notifyListeners();
  }

  void setUserName(String text) {
    userName = text;
    notifyListeners();
  }

  get getJwtToken => jwtToken;
  get getIsOrderAccepted => isOrderAccepted;
  get getSearchText => searchText;
  get getUserName => userName;
}
