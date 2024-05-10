import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function()? onTap;
  //hold a reference to a function taking no arguments and returning void

  const MyDrawerTile({
    super.key, 
    this.text,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(
          text!,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
