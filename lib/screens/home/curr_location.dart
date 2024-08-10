import 'package:flutter/material.dart';

class CurrLocation extends StatelessWidget {
  const CurrLocation({super.key});

  void openLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Locations',
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Search address...'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement search logic
              Navigator.of(context).pop(); // Close the dialog after search
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,
                size: 25, color: Theme.of(context).colorScheme.primary),
            Text('Delivery Now',
                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => openLocation(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chicago, IL',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary)),
                  // drop down menu
                  Icon(Icons.search,
                      color: Theme.of(context).colorScheme.inversePrimary)
                ],
              ),
            )
          ],
        ));
  }
}
