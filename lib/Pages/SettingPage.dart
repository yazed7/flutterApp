// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/themes/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode part
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                //switch part
                //widget that represents a switch with an iOS-style design
                //representing an on/off or true/false state
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,//means the initial is that dark mode is off
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
