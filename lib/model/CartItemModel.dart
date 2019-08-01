class CartItemModel {
  final String name;
  final String id;
  final double price;
  final String unit;
  final String category;
  final int quantity;

  CartItemModel(
      {this.name,
      this.id,
      this.price,
      this.unit,
      this.category,
      this.quantity});

  factory CartItemModel.fromJson(json) {
    return CartItemModel(
        name: json != null ? json['name'] : null,
        id: json['id'],
        price: json['price'].toDouble(),
        unit: json['unit'],
        category: json['category'],
        quantity: json['quantity'].toInt());
  }
}
