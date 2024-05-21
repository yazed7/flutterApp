import 'package:flutter/material.dart';
import '../../../Components/button.dart';
import '../../../themes/componentstheme.dart';
import '../cubit/registertion_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {

  static const String routeName = "/register";

  RegisterPage({super.key});
  final RegistertionCubit controller = RegistertionCubit();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: controller,
        child: BlocBuilder<RegistertionCubit, RegistertionState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: Center(
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //icon
                        Image.asset(
                          "assets/images/Logo.png",
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //message app
                        Text(
                          "Create an account to Restaurant App",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Email Textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.emailController,
                              validator: controller.emailValidation,
                              decoration: Styles.textFieldDecoration(context)
                                  .copyWith(
                                      hintText: "Email",
                                      prefixIcon:
                                          const Icon(Icons.email_outlined))),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Password Textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: controller.passwordValidation,
                            obscureText: true,
                            decoration: Styles.textFieldDecoration(context)
                                .copyWith(
                                    hintText: "Password",
                                    prefixIcon: const Icon(Icons.lock)),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Confirm Password Textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // controller: controller.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: controller.confirmPasswordValidation,
                            obscureText: true,
                            decoration: Styles.textFieldDecoration(context)
                                .copyWith(
                                    hintText: "Confirm Password",
                                    prefixIcon: const Icon(Icons.lock)),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Login Button
                        Buttons(
                          text: 'Sign Up',
                          onPressed: () {
                            controller.onPressedConfirmButton(context);
                          },
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("already have an account? ",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
