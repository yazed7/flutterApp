import 'package:flutter/material.dart';

import '../../Product/Database/entity_model/product_model.dart';
import '../controller/cubit/favorite_cubit.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key, required this.product, required this.controller});
  final ProductModel product;
  final FavoriteCubit controller;
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
                            // const SizedBox(height: 5),
                          ],
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
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
                                      backgroundColor: Colors.blueAccent,
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
                            // Spacer(),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Container(
                        //   width: 1,
                        //   height: 35,
                        //   color: Colors.grey,
                        // ),
                        // Cart
                        // InkWell(
                        //   child: product.cart == 1
                        //       ? const Icon(
                        //           CupertinoIcons.cart,
                        //           color: Colors.blue,
                        //         )
                        //       : const Icon(CupertinoIcons.cart),
                        //   onTap: () {
                        //     if (product.favorite == 1) {
                        //       controller.addItemtoFavorite(product.id ?? 0, 0);
                        //     } else {
                        //       controller.addItemtoFavorite(product.id ?? 0, 1);
                        //     }
                        //   },
                        // ),
                      ],
                    )
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
