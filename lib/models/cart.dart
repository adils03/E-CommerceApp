import 'package:ecommerceapp/api_helper.dart';
import 'package:flutter/material.dart';

import 'product.dart';

/// A class that represents the shopping cart and its operations.
class Cart extends ChangeNotifier {
  final List<Product> _userCart = [];

  /// Fetches the list of products from the API.
  Future<List<Product>> getProductList() {
    return ApiHelper.getProducts();
  }

  /// Returns the list of products in the user's cart.
  List<Product> get userCart => _userCart;

  /// Adds a product to the cart and notifies listeners.
  void addItem(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  /// Removes a product from the cart and notifies listeners.
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }
}
