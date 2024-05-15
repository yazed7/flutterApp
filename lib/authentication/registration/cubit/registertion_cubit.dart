import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/authentication/database/dbHelper.dart';

part 'registertion_state.dart';

class RegistertionCubit extends Cubit<RegistertionState> {
  RegistertionCubit() : super(RegistertionInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  String? emailValidation(String? value) {
    final RegExp emailRegx =
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,}\b');
    if (value!.isEmpty) {
      return 'required field';
    } else if (!emailRegx.hasMatch(value)) {
      return 'invalid email';
    }
    return null; //validation passed
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'required field';
    } else if (value.length < 8) {
      return 'Weak Password';
    }
    return null; //validation passed
  }

  String? confirmPasswordValidation(String? value) {
    if (value!.isEmpty) {
      return 'required field';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> user = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      DatabaseHelper.instance.insertUser(user);
      Navigator.pushNamed(context, '/login');
    }
  }
}
