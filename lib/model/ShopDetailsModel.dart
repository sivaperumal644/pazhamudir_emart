class ShopDetailsModel {
  String branchName;
  String branchAddress;
  String phoneNumber;

  ShopDetailsModel({this.branchName, this.branchAddress, this.phoneNumber});

  factory ShopDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return ShopDetailsModel(
        branchName: json['branchName'],
        branchAddress: json['branchAddress'],
        phoneNumber: json['phoneNumber']);
  }
}
