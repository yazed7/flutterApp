// main.dart
// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Product/cubit/product_cubit.dart';
import 'package:restaurant/authentication/login/view/login_page.dart';
import 'package:restaurant/onboarding/view/onboarding.dart';
import 'package:restaurant/routing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onboarding = sharedPreferences.getBool('onboarding') ?? false;

  runApp(
    MainApp(onboarding: onboarding),
  );
}

class MainApp extends StatelessWidget {
  final bool onboarding;

  const MainApp({super.key, required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: Consumer2<ThemeProvider, ProductCubit>(
        builder: (context, themeProvider, productCubit, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onGenerateRoute,
            onGenerateInitialRoutes: (_) => [
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) =>
                    onboarding ? LoginPage() : const OnBoardingPage(),
              ),
            ],
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
