import 'package:flutter/material.dart';
import 'package:junkie/models/restaurant.dart';
import 'package:junkie/screens/cart/cart_tile.dart';
import 'package:junkie/screens/checkout/index.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                  'Are you sure you want to clear cart?',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    restaurant.clearCart();
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: const Text('Clear'),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.inversePrimary))
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: Column(children: [
            Expanded(
              child: Column(children: [
                useCart.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text('Cart is empty',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary)),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: useCart.length,
                          itemBuilder: (context, index) {
                            final cartItem = useCart[index];
                            return CartTile(
                              cartItem: cartItem,
                              onIncrease: () {
                                restaurant.addFood(
                                    cartItem.food, cartItem.selectedAddOns);
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
            ),
          ]),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PaymentPage();
              }));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: Text(
              'Checkout',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ));
    });
  }
}
