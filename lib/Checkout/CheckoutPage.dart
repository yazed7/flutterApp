import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/Components/button.dart';
import 'package:restaurant/Pages/HomePage.dart';
import 'package:restaurant/Product/Page/product_page.dart';
import 'package:restaurant/cart/cubit/cart_cubit.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.credit_card),
                    labelText: 'Card Number',
                    hintText: 'xxxx-xxxx-xxxx-xxxx',
                  ),
                  validator: (value) {
                    if (value == null || value.length != 16) {
                      return 'Enter 16-digit card number on the front of the card';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.credit_card),
                    labelText: 'CVV',
                    hintText: 'xxx',
                  ),
                  validator: (value) {
                    if (value == null || value.length != 3) {
                      return 'Enter 3-digit CVV on the back of the card';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_pin),
                    labelText: 'Address',
                    hintText: 'Enter your address in detail',
                  ),
                  validator: (value) {
                    if (value == null || value.length < 15) {
                      return 'Please enter address in detail';
                    }
                    return null;
                  },
                ),
                const Text(
                  "* If we do not find a branch near you, we will contact you as soon as possible",
                ),
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: Divider(
                    color: Colors.amber,
                  ),
                ),
                Center(
                  child: Buttons(
                    text: 'Confirm',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Form is valid. Deleting all products from the cart...');

                        context.read<CartCubit>().deleteAllProducts();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductPage()));
                        print('Products deleted from the cart. Navigating back...');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
