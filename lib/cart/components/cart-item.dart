// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:restaurant/cart/cubit/cart_cubit.dart';

import '../../../../Product/Database/entity_model/product_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.controller,
  });

  final ProductModel product;
  final CartCubit controller;

  @override
  Widget build(BuildContext context) {
    final totalPrice = product.price! * (product.quantity ?? 1);

    return Padding(
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.memory(
                product.image ?? Uint8List(1),
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? 'Product Name',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.quantity} x ${product.price} EGP',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '$totalPrice EGP',
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
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: product.cart == 1
                        ? Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )
                        : const Text(''),
                    onTap: () {
                      if (product.cart == 1) {
                        controller.removeFromCart(product.id ?? 0);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Removed from cart'),
                            backgroundColor: Colors.amber,
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(20),
                            elevation: 5,
                            shape: Border(
                              left: BorderSide(
                                color: Colors.amber,
                                width: 5,
                              ),
                              right: BorderSide(
                                color: Colors.amber,
                                width: 5,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
