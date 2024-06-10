import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_tile.dart';
import '../api_helper.dart';
import '../models/cart.dart';
import '../models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late List<Product> _allProducts;
  late List<Product> _filteredProducts;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _allProducts = [];
    _filteredProducts = [];
    _getProducts();
  }

  void _getProducts() async {
    List<Product> products = await ApiHelper.getProducts();
    setState(() {
      _allProducts = products;
      _filteredProducts = products;
    });
  }

  void _filterProducts(String query) {
    List<Product> filteredList = _allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      _filteredProducts = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: _filterProducts,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _filterProducts('');
                  },
                ),
              ),
            ),
          ),

          // Message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Better than best!',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // Hot Picks Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks🔥',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Hot Picks List
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Product shoe = _filteredProducts[index];
                return ProductTile(
                  product: shoe,
                  onTap: () => _addToCart(shoe),
                );
              },
            ),
          ),

          // Divider separating the bottom section
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  void _addToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItem(product);
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully Added!'),
        content: Text('Check Your Cart!'),
      ),
    );
  }
}
