import 'package:ecommerceapp/components/cart_item.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A page that displays the user's shopping cart.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            // Expanded widget to make the ListView take available space
            Expanded(
              child: ListView.builder(
                itemCount: cart.userCart.length,
                itemBuilder: (context, index) {
                  Product individualProduct = cart.userCart[index];
                  return CartItem(
                    product: individualProduct,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
