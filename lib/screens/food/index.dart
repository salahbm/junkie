import 'package:flutter/material.dart';
import 'package:junkie/components/buttons.dart';
import 'package:junkie/models/food.dart';
import 'package:junkie/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOns = {};
  FoodPage({
    super.key,
    required this.food,
  }) {
    for (AddOn addOn in food.addOns) {
      selectedAddOns[addOn] = false;
    }
  }

  @override
  _FoodPage createState() => _FoodPage();
}

class _FoodPage extends State<FoodPage> {
  //  Add logic to add food to cart
  void addToCart(Food food, Map<AddOn, bool> selectedAddOns) {
    List<AddOn> addOns = [];

    for (AddOn addOn in widget.food.addOns) {
      if (selectedAddOns[addOn] == true) {
        addOns.add(addOn);
      }
    }

    context.read<Restaurant>().addFood(food, addOns);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              widget.food.imagePath,
              width: double.infinity,
              height: 450,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 420,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '€${widget.food.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.food.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (widget.food.addOns.isNotEmpty) ...[
                      const Text(
                        'Add-Ons',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.addOns.length,
                        itemBuilder: (context, index) {
                          final addOn = widget.food.addOns[index];
                          return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(addOn.name),
                                    Text(
                                      '+ €${addOn.price.toStringAsFixed(2)}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ]),
                              trailing: Checkbox(
                                activeColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                value: widget.selectedAddOns[addOn] ?? false,
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddOns[addOn] = value!;
                                  });
                                },
                              ));
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                    Center(
                      child: Buttons(
                        onPressed: () {
                          addToCart(widget.food, widget.selectedAddOns);
                        },
                        text: 'Add to cart',
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
