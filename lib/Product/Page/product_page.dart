import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Pages/Dashboard/view/dashboard.dart';
import '../Components/product_item.dart';
import '../cubit/product_cubit.dart';
import './viewscreen_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  static const routeName = '/product_page';
  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = ProductCubit();
    return SafeArea(
      child: BlocProvider.value(
        value: productCubit,
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Menu'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, DashboardPage.routeName);
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Navigator.pushNamed(context, CartPage.routeName);
                    },
                  )
                ],
                toolbarHeight: 70,
              ),
              body: state is ProductStateLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state is ProductStateEmpty
                      ? const Center(child: Text('No Products Found'))
                      :
                      // state is ProductStateLoaded ?
                      ListView.builder(
                          itemCount: productCubit.products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, viewscreen.routeName,
                                  arguments: productCubit.products[index]);
                            },
                            title: ProductItem(
                              product: productCubit.products[index],
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