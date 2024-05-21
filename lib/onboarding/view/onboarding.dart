import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/onboarding/cubit/onboarding_cubit.dart';
import 'package:restaurant/onboarding/cubit/onboarding_state.dart';
import 'package:restaurant/onboarding/view/component/buttons.dart';
import 'package:restaurant/onboarding/view/component/content.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingCubit>(
        create: (context) => OnboardingCubit(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            OnboardingCubit controller = context.read<OnboardingCubit>();
            return Scaffold(
              body: OnboardingContent(
                controller: controller,
              ),
              bottomNavigationBar: OnboardingButtons(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
