import 'dart:convert';

import 'package:ecommerceapp/models/product.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<List<Product>> getProducts() async {
    var response = await http.get(Uri.https('fakestoreapi.com', 'products'));

    var jsonData = jsonDecode(response.body);

    List<Product> products = [];

    //Get all products from json and save to list
    for (var item in jsonData) {
      final product = Product(
          name: item['title'],
          price: item['price'].toString(),
          imagePath: item['image'],
          description: item['description']);
      products.add(product);
    }
    return products;
  }
}
