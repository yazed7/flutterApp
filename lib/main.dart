// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Favorite/view/page/favorite_page.dart';
import 'Pages/Dashboard/view/dashboard.dart';
import 'Pages/HomePage.dart';
import 'Product/Page/product_page.dart';
import 'Product/Page/viewscreen_product.dart';
import 'authentication/login/view/login_page.dart';
import 'authentication/registration/view/register_page.dart';
import 'cart/view/cart-page.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        RegisterPage.routeName: (context) => RegisterPage(),
        DashboardPage.routeName: (context) => DashboardPage(),
        ProductPage.routeName: (context) => ProductPage(),
        FavoritePage.routeName: (context) => FavoritePage(),
        CartPage.routeName: (context) => CartPage(),
        viewscreen.routeName: (context) => viewscreen(),
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: LoginPage.routeName,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
