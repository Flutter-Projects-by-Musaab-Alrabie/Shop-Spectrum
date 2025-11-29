import 'package:e_commerce_app_mvc/Models/products.dart';

class Cart {
  final int id;
  int quantity;
  final Product product;

  Cart({required this.id, required this.quantity, required this.product});

  factory Cart.fromJSON(Map<String, dynamic> json) => Cart(
    id: json['id'],
    quantity: json['quantity'],
    product: Product.fromJSON(json['product']),
  );

  Map<String, dynamic> toJSON() => {
    "id": id,
    "quantity": quantity,
    "product": product.toJSON(),
  };
}