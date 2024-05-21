import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Admin/ProductView/Components/product_itemciew.dart';
import 'package:restaurant/Admin/ProductView/cubit/productview_cubit.dart';
import 'package:restaurant/Admin/ProductView/cubit/productview_state.dart';

import '../../add_products/view/page/add_product_view.dart';


class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});
  static const routeName = '/product_pageview';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => ProductViewCubit(),
        child: BlocBuilder<ProductViewCubit, ProductViewState>(
          builder: (context, state) {
            final productCubit = context.read<ProductViewCubit>();
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
              body: state is ProductViewStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is ProductViewStateEmpty
                      ? const Center(child: Text('No Products Found'))
                      : ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            onTap: () {},
                            title: ProductItemView(
                              product: products[index],
                              controller: productCubit,
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
