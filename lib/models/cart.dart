import 'package:junkie/models/food.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddOns,
    this.quantity = 1,
  });

  double get price {
    double price = food.price;
    for (var addOn in selectedAddOns) {
      price += addOn.price;
    }
    return price;
  }
}
