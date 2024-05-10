// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant/Components/description_box.dart';
import 'package:restaurant/Components/drawer/drawer.dart';
import 'package:restaurant/Components/sliver_app_bar.dart';
import 'package:restaurant/Components/current_location.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: Text('title'),
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
