import 'package:flutter/material.dart';

class CurrLocation extends StatelessWidget {
  const CurrLocation({super.key});

  void openLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Location'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery Now',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            GestureDetector(
              onTap: () => openLocation(context),
              child: Row(
                children: [
                  Text('Current Location',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  // drop down menu
                  Icon(Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.primary)
                ],
              ),
            )
          ],
        ));
  }
}
