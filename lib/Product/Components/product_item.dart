import 'package:flutter/cupertino.dart';
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  // Product Info
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name ?? 'Product Name'),
                          // Text(product.description ?? 'Product Description'),
                          Image.asset('${product.image}',
                              width: 60, height: 60),
                        ],
                      ),
                    ],
                  ),
                  // const Divider(
                  //   thickness: 1.0,
                  // ),
                  // actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Favorite
                      InkWell(
                        child: product.favorite == 1
                            ? const Icon(
                                Icons.star,
                                color: Colors.red,
                              )
                            : const Icon(Icons.star_outline),
                        onTap: () {
                          if (product.favorite == 1) {
                            controller.addItemtoFavorite(product.id ?? 0, 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Removed from favorites'),
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
                          } else {
                            controller.addItemtoFavorite(product.id ?? 0, 1);
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
      ],
    );
  }
}
