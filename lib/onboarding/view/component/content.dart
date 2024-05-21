// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/onboarding/cubit/onboarding_cubit.dart';
import 'package:restaurant/onboarding/cubit/onboarding_state.dart';

class OnboardingContent extends StatelessWidget {
  OnboardingContent({super.key, required this.controller});
  OnboardingCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocProvider<OnboardingCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                OnboardingCubit controller = context.read<OnboardingCubit>();
                return PageView(
                    controller: controller.pageController,
                    children: List.generate(controller.data.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.data[index].title,
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset(controller.data[index].img),
                          ),
                        ],
                      );
                    }));
              },
            ),
          ),
        ),
      ],
    );
  }
}
