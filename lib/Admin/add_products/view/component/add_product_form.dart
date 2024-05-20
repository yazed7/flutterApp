import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Components/button.dart';

import '../../../../themes/componentstheme.dart';
import '../../cubit/add_product_cubit.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();

    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to database'),
              backgroundColor: Colors.blueAccent,
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        } else if (state is AddProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: cubit.nameController,
                    decoration: Styles.textFieldDecoration(context).copyWith(
                      hintText: "Add Product Name",
                      prefixIcon: const Icon(Icons.add),

                    ),
                    validator: cubit.nameValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.descriptionController,
                    decoration: Styles.textFieldDecoration(context).copyWith(
                      hintText: "Product Description",
                      prefixIcon: const Icon(Icons.add),

                    ),
                    validator: cubit.descriptionValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.priceController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.textFieldDecoration(context).copyWith(
                      hintText: "Product Price",
                      prefixIcon: const Icon(Icons.add),
                    ),
                    validator: cubit.priceValidator,
                  ),
                  const SizedBox(height: 16.0),
                  Buttons(
                    onPressed: cubit.pickImage,
                    text: 'Select Image',
                  ),
                  if (state is AddProductImageSelected)
                    FutureBuilder<Uint8List>(
                      future: cubit.image!.readAsBytes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Image.memory(
                              snapshot.data!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error loading image: ${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Buttons(
                      onPressed: cubit.addProduct,
                      text: 'Add Product',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
