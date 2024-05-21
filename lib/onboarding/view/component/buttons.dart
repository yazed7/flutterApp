// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/onboarding/cubit/onboarding_cubit.dart';
import 'package:restaurant/onboarding/cubit/onboarding_state.dart';

class OnboardingButtons extends StatelessWidget {
  OnboardingButtons({super.key, required this.controller});
  OnboardingCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        OnboardingCubit controller = context.read<OnboardingCubit>();
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.0,
                height: 50.0,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFF8F00))),
                  onPressed: () {
                    controller.onCallSkip(context);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150.0,
                height: 50.0,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFF8F00))),
                  onPressed: () {
                    controller.onChangeToNext(context);
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
