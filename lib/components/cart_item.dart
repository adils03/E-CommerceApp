import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A widget that represents an item in the cart.
class CartItem extends StatefulWidget {
  final Product product;

  // Constructor to initialize the product.
  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  /// Removes the item from the cart and shows a dialog.
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.product);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Successfully Removed'),
        content: Text('${widget.product.name} has been removed from the cart.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100], // Background color for the cart item.
        borderRadius:
            BorderRadius.circular(8), // Rounded corners for the container.
      ),
      margin: const EdgeInsets.only(
          bottom: 10), // Margin at the bottom of the container.
      child: ListTile(
        leading: Image.network(widget.product.imagePath), // Product image.
        title: Text(widget.product.name), // Product name.
        subtitle: Text('\$${widget.product.price}'), // Product price.
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart, // Removes item from cart on press.
        ),
      ),
    );
  }
}
