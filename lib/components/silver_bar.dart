import 'package:flutter/material.dart';

class SilverBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const SilverBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 320,
        collapsedHeight: 120,
        floating: false,
        pinned: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_checkout,
                  color: Theme.of(context).colorScheme.primary))
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        flexibleSpace: FlexibleSpaceBar(background: child),
        title: title);
  }
}
