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
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  height: 180,
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery:',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              ' 12.0 EGP',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8F00),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' ${cartCubit.totalPrice + 12.0} EGP',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8F00),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, CheckoutPage.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8F00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                        ),
                      ),
                    ],
                  ),
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
