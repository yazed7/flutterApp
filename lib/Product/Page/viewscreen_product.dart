import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Database/entity_model/product_model.dart';
import '../cubit/product_cubit.dart';

class ViewscreenProduct extends StatelessWidget {
  const ViewscreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    final productCubit = context.read<ProductCubit>();

    return BlocProvider.value(
      value: productCubit,
      child: Scaffold(
        appBar: AppBar(
          // title: Text(
          //   product.name ?? 'Product Name',
          //   style: const TextStyle(
          //     fontSize: 18.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 50,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Image.memory(
                  product.image ?? Uint8List(1),
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name ?? 'Product Name',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Text(
                    '${product.price} EGP',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF8F00),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                product.description ?? 'Product Description',
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      productCubit.decreaseProductQuantity(product);
                    },
                  ),
                  Text(
                    '${product.quantity}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      productCubit.increaseProductQuantity(product);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    productCubit.addItemToCart(
                        product.id ?? 0, true, product.quantity as int);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart'),
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
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: product.cart == 1
                        ? Colors.amber
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text('Add to cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
