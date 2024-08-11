import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('\$3.99',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ),
              Text('Delivery Free',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('15-20 min',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
              ),
              Text('Delivery Time',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ],
          )
        ],
      ),
    );
  }
}
