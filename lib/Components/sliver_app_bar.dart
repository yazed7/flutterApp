// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../cart/view/cart-page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;

  const MySliverAppBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, //not all the screen
      floating: false,
      expandedHeight: 340, //down
      collapsedHeight: 90, //up
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, CartPage.routeName);
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.secondary,
      foregroundColor:
          Theme.of(context).colorScheme.inversePrimary, //at the top
      title: const Text('Sunset Diner'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
