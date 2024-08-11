import 'package:flutter/material.dart';
import 'package:junkie/screens/home/curr_location.dart';
import 'package:junkie/components/drawer.dart';
import 'package:junkie/components/silver_bar.dart';
import 'package:junkie/screens/home/description_box.dart';
import 'package:junkie/screens/home/tabs.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
          body: TabBarView(
            controller: _tabController,
            children: [
              // home
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text('Item $index'),
                    ),
                  ),
                ),
              ),
              // settings
              Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary),
              // profile
              Icon(Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ],
          ),
        ));
  }
}
