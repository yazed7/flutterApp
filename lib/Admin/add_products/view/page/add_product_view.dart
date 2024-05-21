import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/add_product_cubit.dart';
import '../component/add_product_form.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});
  static const routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddProductCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 70,
        ),
        body: const AddProductForm(),
      ),
    );
  }
}
