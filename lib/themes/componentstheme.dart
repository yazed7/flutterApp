import 'package:flutter/material.dart';

class Styles {
  static InputDecoration textFieldDecoration(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return InputDecoration(
      hintText: "hint",
      hintStyle: TextStyle(color: themeData.colorScheme.primary),
      prefixIcon: const Icon(Icons.account_circle),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themeData.colorScheme.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themeData.colorScheme.tertiary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: themeData.colorScheme.error),
      ),
    );
  }
}
