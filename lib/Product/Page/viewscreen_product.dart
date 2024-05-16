import 'package:flutter/material.dart';
import 'package:restaurant/Pages/Dashboard/view/dashboard.dart';
import 'package:restaurant/Product/Page/product_page.dart';
import '../Database/entity_model/product_model.dart';

class viewscreen extends StatelessWidget {
  const viewscreen({super.key});
  static const routeName = '/viewScreen';
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.transparent,
          title: Text('${product.name}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, DashboardPage.routeName);
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
                      onPressed: () {}, child: const Text('Add to cart')),
                ],
              ),
            )),
      ),
    );
  }
}
