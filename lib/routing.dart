import 'package:flutter/material.dart';
import 'package:restaurant/Admin/ProductView/Page/product_pageview.dart';
import 'package:restaurant/Admin/add_products/view/page/add_product_view.dart';
import 'package:restaurant/Admin/admin_page/admin-page.dart';
import 'package:restaurant/Favorite/view/page/favorite_page.dart';
import 'package:restaurant/Pages/Dashboard/view/dashboard.dart';
import 'package:restaurant/Product/Page/product_page.dart';
import 'package:restaurant/Product/Page/viewscreen_product.dart';
import 'package:restaurant/authentication/login/view/login_page.dart';
import 'package:restaurant/authentication/registration/view/register_page.dart';
import 'package:restaurant/cart/view/page/cart-page.dart';
import 'package:restaurant/onboarding/view/onboarding.dart';

class Routes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => LoginPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        );
      case '/onboarding':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
      case '/admin_page':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const AdminPage(),
        );
      case '/product_pageview':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ProductPageView(),
        );
      case '/add_product':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const AddProductPage(),
        );
      case '/register':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => RegisterPage(),
        );
      case '/dashboard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardPage(),
        );
      case '/product_page':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ProductPage(),
        );

      case '/favorite_page':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const FavoritePage(),
        );

      case '/cart_page':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const CartPage(),
        );

      case '/viewscreen':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ViewscreenProduct(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        );
    }
  }
}
