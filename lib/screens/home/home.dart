import 'package:flutter/material.dart';
import 'package:junkie/models/food.dart';
import 'package:junkie/models/restaurant.dart';
import 'package:junkie/screens/home/curr_location.dart';
import 'package:junkie/components/drawer.dart';
import 'package:junkie/components/silver_bar.dart';
import 'package:junkie/screens/home/description_box.dart';
import 'package:junkie/screens/home/tabs.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return list of food items that belong to category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Method to generate ListView widgets by category
  List<Widget> _getMenuByCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Text(
                category.toString().split('.').last, // Display category name
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryMenu.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(categoryMenu[index].name),
                      subtitle: Text(
                          '\$${categoryMenu[index].price.toStringAsFixed(2)}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SilverBar(
                title: Tabs(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    // my curr location
                    const CurrLocation(),
                    // description box
                    const DescriptionBox(),
                  ],
                ))
          ],
          body: Consumer<Restaurant>(
            builder: (context, value, child) => TabBarView(
              controller: _tabController,
              children: _getMenuByCategory(value.menu),
            ),
          ),
        ));
  }
}
