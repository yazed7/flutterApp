import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    decoration: const InputDecoration(
                      labelText: 'Product Name',
                    ),
                    validator: cubit.nameValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Product Description',
                    ),
                    validator: cubit.descriptionValidator,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cubit.priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Product Price',
                    ),
                    validator: cubit.priceValidator,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: cubit.pickImage,
                    child: const Text('Select Image'),
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
                    child: ElevatedButton(
                      onPressed: cubit.addProduct,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Text('Add Product'),
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
