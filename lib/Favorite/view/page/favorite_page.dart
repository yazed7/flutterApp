import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../Pages/Dashboard/view/dashboard.dart';
import '../../../Product/Page/viewscreen_product.dart';
import '../../../cart/view/cart-page.dart';
import '../../Component/favorite_item.dart';
import '../../controller/cubit/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  static const routeName = '/favorite_page';
  @override
  Widget build(BuildContext context) {
    final FavoriteCubit productCubit = FavoriteCubit();
    return SafeArea(
      child: BlocProvider.value(
        value: productCubit,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favorite'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, DashboardPage.routeName);
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, CartPage.routeName);
                    },
                  )
                ],
                toolbarHeight: 70,
              ),
              body: state is FavoriteStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is FavoriteStateEmpty
                      ? const Center(child: Text('No Favorites Found'))
                      :
                      // state is ProductStateLoaded ?
                      ListView.builder(
                          itemCount: productCubit.products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, viewscreen.routeName,
                                  arguments: productCubit.products[index]);
                            },
                            title: FavoriteItem(
                              product: productCubit.products[index],
                              controller: productCubit,
                            ),
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
