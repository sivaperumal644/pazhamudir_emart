import 'dart:convert';

import 'package:pazhamuthir_emart_service/model/AddressModel.dart';
import 'package:pazhamuthir_emart_service/model/CartItemModel.dart';
import 'package:pazhamuthir_emart_service/model/StaffModel.dart';

class OrderModel {
  final String id;
  final String orderNo;
  final AddressModel address;
  final List<CartItemModel> cartItems;
  final String status;
  final DateTime datePlaced;
  final DateTime updatedDate;
  final StaffModel staff;

  OrderModel(
      {this.id,
      this.orderNo,
      this.address,
      this.cartItems,
      this.status,
      this.datePlaced,
      this.updatedDate,
      this.staff});

  factory OrderModel.fromJson(Map<dynamic, dynamic> json) {
    List cartItems = jsonDecode(json['cartItems']);
    return OrderModel(
      id: json['id'],
      orderNo: json['orderNo'],
      address: AddressModel.fromJson(jsonDecode(json['address'])),
      cartItems: cartItems.map((item) => CartItemModel.fromJson(item)).toList(),
      // status: json['status'],
      datePlaced:
          DateTime.fromMicrosecondsSinceEpoch(int.parse(json['datePlaced'])),
      updatedDate:
          DateTime.fromMicrosecondsSinceEpoch(int.parse(json['updatedDate'])),
      staff: json['staff'] != null ? StaffModel.fromJson(json['staff']) : null,
    );
  }

  double getTotalPrice() {
    double price = 0;
    cartItems.forEach((item) {
      price += item.price;
    });
    return price;
  }
}
