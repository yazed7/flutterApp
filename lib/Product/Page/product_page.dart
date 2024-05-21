import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Pages/Dashboard/view/dashboard.dart';
import '../../cart/view/page/cart-page.dart';
import '../Components/product_item.dart';
import '../cubit/product_cubit.dart';
import './viewscreen_product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  static const routeName = '/product_page';

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
                      Navigator.pushNamed(context, '/cart_page');
                    },
                  )
                ],
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
                              Navigator.pushNamed(
                                context,
                                '/viewscreen',
                                arguments: products[index],
                              );
                            },
                            title: ProductItem(
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
