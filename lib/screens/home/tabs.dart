import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  final TabController tabController;
  const Tabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Theme.of(context).colorScheme.surface,
      controller: tabController,
      tabs: [
        Icon(Icons.home_filled,
            color: Theme.of(context).colorScheme.inversePrimary),
        Icon(Icons.favorite_border,
            color: Theme.of(context).colorScheme.inversePrimary),
        Icon(Icons.person_outline,
            color: Theme.of(context).colorScheme.inversePrimary),
      ],
    );
  }
}
