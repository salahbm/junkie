import 'package:flutter/material.dart';
import 'package:junkie/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text(food.name, style: const TextStyle(fontSize: 20)),
                  Text('€${food.price.toStringAsFixed(2)}'),
                  Text(food.description),
                ],
              )),
              Image.asset(
                food.imagePath,
                height: 120,
                width: 120,
              ),
            ],
          ))
    ]);
  }
}
