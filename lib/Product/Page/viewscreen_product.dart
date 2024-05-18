import 'dart:math';

import 'package:flutter/material.dart';
import '../Database/entity_model/product_model.dart';
import '../cubit/product_cubit.dart';

class viewscreen extends StatelessWidget {
  const viewscreen({super.key});
  static const routeName = '/viewScreen';
  @override
  Widget build(BuildContext context) {
    final ProductModel pro = ProductModel();
    var product = ModalRoute.of(context)?.settings.arguments as ProductModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.transparent,
          title: Text('${product.name}'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    '${product.image}',
                    width: 100,
                    height: 100,
                  ),
                  Text('${product.name}'),
                  Text('${product.description}'),
                  // Text('${product.quantity}'),
                  const SizedBox(
                    height: 400,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // cartCubit.addItemtoCart(pro.id ?? 0, 1);
                      // print(product.cart);
                    },
                    child: const Text('Add to cart'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
