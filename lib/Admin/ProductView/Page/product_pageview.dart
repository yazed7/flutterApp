import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Admin/ProductView/Components/product_itemciew.dart';
import 'package:restaurant/Admin/add_products/view/page/add_product_view.dart';
import 'package:restaurant/Admin/cubit/delete_cubit.dart';

import '../../../Product/cubit/product_cubit.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});
  static const routeName = '/product_pageview';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => ProductCubit(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            final productCubit = context.read<ProductCubit>();
            final products = productCubit.products;

            return Scaffold(
              appBar: AppBar(
                title: const Text('Products Added'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(
                        context, AddProductPage.routeName);
                  },
                ),
                toolbarHeight: 70,
              ),
              body: state is ProductStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is ProductStateEmpty
                      ? const Center(child: Text('No Products Found'))
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            onTap: () {
                              // Navigator.pushNamed(
                              //   context,
                              //   ViewscreenProduct.routeName,
                              //   arguments: products[index],
                              // );
                            },
                            title: ProductItemView(
                              product: products[index],
                              controller: DeleteCubit(),
                            ),
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
