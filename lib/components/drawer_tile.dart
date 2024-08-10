import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const DrawerTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onTap: onTap);
  }
}
