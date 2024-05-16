// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Favorite/view/page/favorite_page.dart';
// import 'package:restaurant/Pages/Product/view/page/product_page.dart';
// import 'package:restaurant/Pages/Product/view/page/viewscreen_product.dart';
import 'Pages/Dashboard/view/dashboard.dart';
import 'Pages/HomePage.dart';
import 'Product/Page/product_page.dart';
import 'Product/Page/viewscreen_product.dart';
import 'authentication/login/view/login_page.dart';
import 'authentication/registration/view/register_page.dart';
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
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => DashboardPage(),
        '/product': (context) => ProductPage(),
        '/favorite_page': (context) => FavoritePage(),
        '/viewScreen': (context) => viewscreen(),
        '/home': (context) => HomePage(),
      },
      initialRoute: '/login',
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
