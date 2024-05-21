import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:restaurant/Admin/ProductView/cubit/productview_cubit.dart';

import '../../../Product/Database/entity_model/product_model.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({
    super.key,
    required this.product,
    required this.controller,
  });

  final ProductModel product;
  final ProductViewCubit controller;

  @override
  Widget build(BuildContext context) {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? 'Product Name',
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
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
                    ),
              const SizedBox(width: 10),
                        InkWell(
                          child: const Icon(Icons.delete),
                          onTap: () {
                            controller.deleteProduct(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Removed from Database'),
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
                        ),
                      
                     
                  ],
                ),
              ),
      ),
    );
  }
}
