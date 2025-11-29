import 'dart:convert';
import 'package:e_commerce_app_mvc/Models/cart.dart';
import 'package:e_commerce_app_mvc/Models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CRUD {
  static String baseAPI = "https://fakestoreapi.com";

  //-------------------------<Fetch all products from the API>---------------------------
  static Future<List<Product>> fetchProduct() async {
    final response = await http.get(Uri.parse("$baseAPI/products"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data
          .map((dataForProduct) => Product.fromJSON(dataForProduct))
          .toList();
    } else {
      throw Exception("Fail to fetch API");
    }
  }
  //-------------------------------------------------------------------------------------

  static Future<Cart> addToCart(Product product, int quantity) async {
    final response = await http.post(
      Uri.parse("$baseAPI/carts"),
      body: jsonEncode({"product": product.toJSON(), "quantity": quantity}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Cart.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception("Fail to add the product to cart");
    }
  }
}
