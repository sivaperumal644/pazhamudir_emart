import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  AppState() {
    getFromMemory();
  }

  bool isOrderAccepted = false;
  bool isUserDelivery = false;
  String jwtToken = "";
  String searchText = "";
  String userName = "";
  String orderId = "";
  String staffId = '';
  String deliveryStaffId = "";
  bool staffSelected = false;
  bool isStaffAssignedSelected = false;

  void setIsStaffAssignedSelected(bool text) {
    isStaffAssignedSelected = text;
    notifyListeners();
  }

  void setIsUserDelivery(bool t) {
    isUserDelivery = t;
    notifyListeners();
  }

  void setStaffId(String s) {
    staffId = s;
    notifyListeners();
  }

  void setIsOrderAccepted(bool text) {
    isOrderAccepted = text;
    notifyListeners();
  }

  Future getFromMemory() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString("token") ?? "";
    final name = pref.getString("name") ?? "";
    final deliveryId = pref.getString("staffId") ?? "";
    isUserDelivery = pref.getBool('isDelivery') ?? false;
    jwtToken = token;
    userName = name;
    deliveryStaffId = deliveryId;
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

  void setOrderId(String text) {
    orderId = text;
    notifyListeners();
  }

  void setIsStaffSelected(bool text) {
    staffSelected = true;
  }

  get getJwtToken => jwtToken;
  get getIsOrderAccepted => isOrderAccepted;
  get getIsUserDelivery => isUserDelivery;
  get getSearchText => searchText;
  get getUserName => userName;
  get getOrderId => orderId;
  get getStaffId => staffId;
  get getIsStaffSelected => staffSelected;
  get getIsStaffAssigned => isStaffAssignedSelected;
}
