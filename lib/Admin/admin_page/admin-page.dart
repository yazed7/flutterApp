import 'package:flutter/material.dart';
import 'package:restaurant/Admin/ProductView/Page/product_pageview.dart';
import 'package:restaurant/Components/button.dart';
import 'package:restaurant/authentication/login/View/login_page.dart';

import '../add_products/view/page/add_product_view.dart';

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
              Navigator.pushNamed(context, AddProductPage.routeName);
            },
            text: "Add Product",
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamed(context, ProductPageView.routeName);
            },
            text: "View Product",
          ),
          Buttons(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
            text: "Logout",
          ),
        ]))));
  }
}
