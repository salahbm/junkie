import 'package:flutter/material.dart';
import 'package:junkie/components/drawer_tile.dart';
import 'package:junkie/screens/profile/profile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Icon(
                Icons.lock_open_rounded,
                size: 80.0,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            DrawerTile(
              icon: Icons.home,
              title: 'Home',
              onTap: () => Navigator.pop(context),
            ),
            DrawerTile(
              icon: Icons.person,
              title: 'Profile',
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()))
              },
            ),
            const Spacer(),
            DrawerTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
            const SizedBox(height: 75),
          ],
        ));
  }
}
