import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/// A bottom navigation bar using Google Nav Bar package.
/// [onTabChange] is a callback function to handle tab changes.
class MyBottomNav extends StatelessWidget {
  // Callback function for tab change.
  final void Function(int)? onTabChange;

  // Constructor to initialize the callback function.
  const MyBottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400], // Color of inactive icons.
        activeColor: Colors.grey.shade700, // Color of active icons.
        tabActiveBorder:
            Border.all(color: Colors.white), // Border for active tab.
        tabBackgroundColor:
            Colors.grey.shade100, // Background color for active tab.
        mainAxisAlignment: MainAxisAlignment.center, // Center align tabs.
        tabBorderRadius: 16, // Border radius for tabs.
        gap: 8, // Gap between icon and text.
        onTabChange: onTabChange, // Callback for tab change.
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            iconActiveColor: Colors.black, // Active icon color for 'Shop' tab.
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            iconActiveColor: Colors.blue, // Active icon color for 'Cart' tab.
          ),
        ],
      ),
    );
  }
}
