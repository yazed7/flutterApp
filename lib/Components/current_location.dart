// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text('Your Location'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: "Search Address ..."
          ),
        ),
        actions: [
          MaterialButton(
            onPressed:  () =>Navigator.pop(context),
            child: Text("Cancel")),
            MaterialButton(
            onPressed:  () =>Navigator.pop(context),
            child: Text("Save")),
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap:()=>openLocationSearchBox(context) ,
            child: Row(
              children: [
                // address
                Text("Shebin-Stadium Street",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    )),
                // drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
