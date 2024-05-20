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
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  selectedItemColor: Colors.amber.shade800,
                  currentIndex: cont.currentIndex,
                  onTap: cont.onChangeTab,
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        decoration: cont.currentIndex == 0
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              )
                            : null,
                        child: const Icon(Icons.home_filled),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        decoration: cont.currentIndex == 1
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              )
                            : null,
                        child: const Icon(Icons.restaurant_menu_outlined),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        decoration: cont.currentIndex == 2
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              )
                            : null,
                        child: const Icon(Icons.star_outlined),
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
