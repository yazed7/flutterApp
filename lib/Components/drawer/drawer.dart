import 'package:flutter/material.dart';
import 'package:restaurant/Components/drawer/drawer_tile.dart';
import 'package:restaurant/Pages/SettingPage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            //1-app logo
            Padding(
              padding: const EdgeInsets.only(top: 100,right: 30),
              child: Image.asset(
                "assets/images/Logo.png",
                height: 80,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),

            //2-home
            MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            //3-setting
            MyDrawerTile(
                text: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                }),

            const Spacer(),

            //logout
            MyDrawerTile(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: () {},
            ),

            const SizedBox(height: 25),
          ],
        ));
  }
}
