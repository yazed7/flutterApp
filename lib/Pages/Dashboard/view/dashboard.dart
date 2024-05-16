import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Pages/HomePage.dart';
// import 'package:restaurant/Pages/Product/view/page/product_page.dart';

import '../../../Favorite/view/page/favorite_page.dart';
import '../../../Product/Page/product_page.dart';
import '../cubit/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  final DashboardCubit cont = DashboardCubit();
  static const String routeName = '/dashboard';
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cont,
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: PageView(
                controller: cont.pageController,
                onPageChanged: cont.onChangeTab,
                children: const [
                  HomePage(),
                  ProductPage(),
                  FavoritePage(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.amber.shade800,
                currentIndex: cont.currentIndex,
                onTap: cont.onChangeTab,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Faverites',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
