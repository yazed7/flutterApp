import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/authentication/database/dbHelper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void onPressedConfirmButton(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic>? user =
          await DatabaseHelper.instance.getUser(emailController.text);
      if (user != null && user['password'] == passwordController.text) {
        Navigator.pushNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please check Email or Password'),
            backgroundColor: Colors.amber,
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(20),
            elevation: 5,
            shape: Border(
              left: BorderSide(
                color: Colors.amber,
                width: 5,
              ),
              right: BorderSide(
                color: Colors.amber,
                width: 5,
              ),
            ),
          ),
        );
      }
    }
  }
}
