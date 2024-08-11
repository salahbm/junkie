import 'package:flutter/material.dart';
import 'package:junkie/models/food.dart';

class Tabs extends StatelessWidget {
  final TabController tabController;
  const Tabs({super.key, required this.tabController});

  List<Tab> _buildCategories() {
    return FoodCategory.values
        .map((category) => Tab(
              text: category.toString().split('.').last,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Theme.of(context).colorScheme.surface,
      controller: tabController,
      tabs: _buildCategories(),
    );
  }
}
