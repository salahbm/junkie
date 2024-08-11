import 'package:flutter/material.dart';
import 'package:junkie/models/restaurant.dart';
import 'package:junkie/screens/cart/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final useCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text('Cart',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary)),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: useCart.length,
              itemBuilder: (context, index) {
                final cartItem = useCart[index];
                return CartTile(
                  cartItem: cartItem,
                  onIncrease: () {
                    restaurant.addFood(cartItem.food, cartItem.selectedAddOns);
                  },
                  onDecrease: () {
                    restaurant.removeFromCart(cartItem);
                  },
                  onRemove: () {
                    restaurant.removeFood(cartItem.food);
                  },
                );
              },
            ),
          )
        ]),
      );
    });
  }
}
