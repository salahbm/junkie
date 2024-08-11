import 'package:flutter/material.dart';

class SilverBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const SilverBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      collapsedHeight: 70,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_checkout,
                color: Theme.of(context).colorScheme.inversePrimary))
      ],
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(Icons.menu,
            color: Theme.of(context).colorScheme.inversePrimary),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        'Junkie',
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
