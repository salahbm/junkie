import 'package:flutter/material.dart';
import 'package:junkie/components/curr_location.dart';
import 'package:junkie/components/drawer.dart';
import 'package:junkie/components/silver_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SilverBar(
                title: Text('Home'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    // my curr location
                    const CurrLocation(),
                    // description box
                  ],
                ))
          ],
          body: const Center(child: Text('Home')),
        ));
  }
}
