import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Database/entity_model/product_model.dart';
import '../cubit/product_cubit.dart';

class ViewscreenProduct extends StatelessWidget {
  const ViewscreenProduct({super.key});
  static const routeName = '/viewscreen';

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    final productCubit = context.read<ProductCubit>();
    final mediaQuery = MediaQuery.of(context);

    return BlocProvider.value(
      value: productCubit,
      child: Scaffold(
        appBar: AppBar(
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
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: mediaQuery.viewInsets.bottom + 16.0, // Adjusts for bottom overflow
          ),
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
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name ?? 'Product Name',
                    style: TextStyle(
                      fontSize: 20.0,
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
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.description ?? 'Product Description',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.amber.shade800,
                      shape: const CircleBorder(),
                    ),
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
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.amber.shade800,
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      productCubit.increaseProductQuantity(product);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                productCubit.addItemToCart(
                  product.id ?? 0,
                  true,
                  product.quantity as int,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Added to cart'),
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
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8F00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
