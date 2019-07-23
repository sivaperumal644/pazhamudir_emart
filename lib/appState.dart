import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  AppState() {
    getFromMemory();
  }

  bool isOrderAccepted = false;
  String jwtToken = "";
  String searchText = "";

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

  void setSearchText(String text){
    searchText = text;
    notifyListeners();
  }

  get getJwtToken => jwtToken;
  get getIsOrderAccepted => isOrderAccepted;
  get getSearchText => searchText;
}
