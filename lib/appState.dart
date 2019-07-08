import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  AppState();

  bool isOrderAccepted = false;

  void setIsOrderAccepted(bool text) {
    isOrderAccepted = text;
    notifyListeners();
  }

  get getIsOrderAccepted => isOrderAccepted;
}
