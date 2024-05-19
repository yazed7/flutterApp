import 'package:flutter/material.dart';
import '../Database/entity_model/product_model.dart';
import '../cubit/product_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.product, required this.controller});
  final ProductModel product;
  final ProductCubit controller;
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
                        // Favorite
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: product.favorite == 1
                                  ? const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 227, 207, 27),
                                    )
                                  : const Icon(Icons.star_outline),
                              onTap: () {
                                if (product.favorite == 1) {
                                  controller.addItemtoFavorite(
                                      product.id ?? 0, 0);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Removed from favorites'),
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
                                } else {
                                  controller.addItemtoFavorite(
                                      product.id ?? 0, 1);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added to favorites'),
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
