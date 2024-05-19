import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Product/Page/viewscreen_product.dart';
import '../components/cart-item.dart';
import '../cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const routeName = '/cart_page';
  @override
  Widget build(BuildContext context) {
    final CartCubit productCubit = CartCubit();
    return SafeArea(
      child: BlocProvider.value(
        value: productCubit,
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Cart'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
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
              body: state is CartStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is CartStateEmpty
                      ? const Center(child: Text('No Products Found'))
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
                            title: CartItem(
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
