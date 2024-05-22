// ignore_for_file: prefer_const_constructors, equal_keys_in_map
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Admin/ProductView/Page/product_pageview.dart';
import 'package:restaurant/Admin/admin_page/admin-page.dart';
import 'package:restaurant/Checkout/CheckoutPage.dart';
import 'package:restaurant/Product/Page/viewscreen_product.dart';
import 'package:restaurant/Product/cubit/product_cubit.dart';
import 'package:restaurant/authentication/login/View/login_page.dart';
import 'package:restaurant/authentication/registration/View/register_page.dart';
import 'package:restaurant/cart/cubit/cart_cubit.dart';

import 'Admin/add_products/view/page/add_product_view.dart';
import 'Favorite/view/page/favorite_page.dart';
import 'Pages/Dashboard/view/dashboard.dart';
import 'Pages/HomePage.dart';
import 'Product/Page/product_page.dart';

import 'cart/view/page/cart-page.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: Consumer2<ThemeProvider, ProductCubit>(
        builder: (context, themeProvider, productCubit, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
            routes: {
              CheckoutPage.routeName: (context) => CheckoutPage(),
              AdminPage.routeName: (context) => AdminPage(),
              ProductPageView.routeName: (context) => ProductPageView(),
              AddProductPage.routeName: (context) => AddProductPage(),
              LoginPage.routeName: (context) => LoginPage(),
              RegisterPage.routeName: (context) => RegisterPage(),
              DashboardPage.routeName: (context) => DashboardPage(),
              ProductPage.routeName: (context) => ProductPage(),
              FavoritePage.routeName: (context) => FavoritePage(),
              CartPage.routeName: (context) => CartPage(),
              ViewscreenProduct.routeName: (context) => ViewscreenProduct(),
              AddProductPage.routeName: (context) => AddProductPage(),
              HomePage.routeName: (context) => HomePage(),
            },
            initialRoute: LoginPage.routeName,
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
