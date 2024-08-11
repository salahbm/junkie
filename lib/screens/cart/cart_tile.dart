import 'package:flutter/material.dart';
import 'package:junkie/models/cart.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.tertiary,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                cartItem.food.imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.food.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    ' ${cartItem.selectedAddOns.map((addon) => addon.name).join(', ')}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Price: \$${(cartItem.food.price * cartItem.quantity).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        onDecrease();
                      },
                    ),
                    Text(
                      cartItem.quantity.toString(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.add,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        onIncrease();
                      },
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    onRemove();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
