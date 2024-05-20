import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Product/Database/entity_model/product_model.dart';
import '../cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product, required this.controller});
  final ProductModel product;
  final CartCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 430,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // Product Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('${product.image}', width: 60, height: 60),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              product.name ?? 'Product Name',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Cart
                            InkWell(
                              child: product.cart == 1
                                  ? Icon(
                                      Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    )
                                  : const Text(''),
                              onTap: () {
                                if (product.cart == 1) {
                                  controller.addItemtoCart(
                                      product.id ?? 0, false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Removed from cart'),
                                      backgroundColor: Colors.blueAccent,
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(20),
                                      elevation: 5,
                                      shape: Border(
                                        left: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 5,
                                        ),
                                        right: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 5,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Text(
                              '${product.price} EGP',
                              style: TextStyle(
                                color: Colors.amber.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
