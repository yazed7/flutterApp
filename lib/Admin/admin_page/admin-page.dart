import 'package:flutter/material.dart';
import 'package:restaurant/Components/button.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          const Text(
            "Admin Page",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF8F00),
            ),
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamed(context, '/add_product');
            },
            text: "Add Product",
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamed(context, '/product_pageview');
            },
            text: "View Product",
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            text: "Logout",
          ),
        ]))));
  }
}
