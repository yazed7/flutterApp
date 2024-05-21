// onboarding/cubit/onboarding_cubit.dart
// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/authentication/login/View/login_page.dart';
import 'package:restaurant/onboarding/cubit/onboarding_state.dart';
import 'package:restaurant/onboarding/oboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() :super(OnboardingInitial());
  PageController pageController = PageController();

  void onChangeToNext(BuildContext context) {
    if (pageController.page == data.length - 1) {
      onCallSkip(context);
    } else {
      pageController.nextPage(
        duration: const Duration(microseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>  LoginPage(),
      ),
    );
  }

  List<OnboardingModel> data = [
    OnboardingModel(
      title: 'The Tower of Burger Power: Where Tasty Meets Gravity-Defying!',
      img: 'assets/onboarding/1.jpg',
    ),
    OnboardingModel(
      title:
          'Enjoy our delicious meals delivered straight to your door in a flash with our speedy courier service.',
      img: 'assets/onboarding/2.jpg',
    ),
    OnboardingModel(
      title: 'Hungry? Just follow the trail of cheese and bacon to our door.',
      img: 'assets/onboarding/3.jpg',
    ),
  ];
}
