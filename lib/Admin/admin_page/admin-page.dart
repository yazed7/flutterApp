import 'package:flutter/material.dart';
import 'package:restaurant/Admin/add_products/view/page/add_product_view.dart';
import 'package:restaurant/authentication/login/view/login_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  static const routeName = '/admin_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          const Text("Admin Page"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductPage.routeName);
            },
            child: const Text("Add Product"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            child: const Text("Logout"),
          ),
        ]))));
  }
}
