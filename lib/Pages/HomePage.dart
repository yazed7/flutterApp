import 'package:flutter/material.dart';
import '../Components/current_location.dart';
import '../Components/description_box.dart';
import '../Components/drawer/drawer.dart';
import '../Components/sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: const Text('title'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  indent: 25,
                  endIndent: 25,
                ),
                // current location
                const MyCurrentLocation(),

                //description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
