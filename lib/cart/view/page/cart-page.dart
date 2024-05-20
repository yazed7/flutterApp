import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Product/Page/viewscreen_product.dart';
// import 'package:restaurant/checkout/view/checkout_page.dart';

import '../components/cart-item.dart';
import '../../cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static const routeName = '/cart_page';

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = CartCubit();

    return SafeArea(
      child: BlocProvider.value(
        value: cartCubit,
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
                      : ListView.builder(
                          itemCount: cartCubit.products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ViewscreenProduct.routeName,
                                  arguments: cartCubit.products[index]);
                            },
                            title: CartItem(
                              product: cartCubit.products[index],
                              controller: cartCubit,
                            ),
                          ),
                        ),
              bottomNavigationBar: Container(
                height: 80,
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ${cartCubit.totalPrice} EGP',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, CheckoutPage.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
