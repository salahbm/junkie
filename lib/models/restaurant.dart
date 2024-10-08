import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:junkie/models/cart.dart';
import 'package:junkie/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
        name: 'Cheese Burger',
        imagePath: 'assets/food/burgers/cheese_burger.png',
        description:
            'A classic cheeseburger with a juicy beef patty, topped with melted American cheese, crisp lettuce, tomato, and pickles, all sandwiched between a soft brioche bun. Served with a side of waffle fries.',
        price: 5.99,
        category: FoodCategory.burgers,
        addOns: [
          AddOn(name: 'Extra Patty', price: 1.25),
          AddOn(name: 'Extra Cheese', price: 0.50),
        ]),
    Food(
        name: 'Grilled Chicken Burger',
        imagePath: 'assets/food/burgers/chicken_avacado.png',
        description:
            'A gourmet burger featuring a grilled chicken breast, topped with avocado slices, fresh spinach, and tangy chipotle mayo, all nestled in a whole wheat bun.',
        price: 6.99,
        category: FoodCategory.burgers,
        addOns: [
          AddOn(name: 'Extra Avocado', price: 0.75),
          AddOn(name: 'Bacon', price: 1.50),
        ]),
    Food(
        name: 'Vegetarian Burger',
        imagePath: 'assets/food/burgers/vegetarian.png',
        description:
            'A vegetarian burger made with a black bean patty, topped with fresh lettuce, tomato, red onion, and creamy avocado spread on a whole grain bun.',
        price: 5.49,
        category: FoodCategory.burgers,
        addOns: [
          AddOn(name: 'Extra Avocado', price: 0.75),
          AddOn(name: 'Vegan Cheese', price: 1.00),
        ]),
    Food(
        name: 'Double Bacon Burger',
        imagePath: 'assets/food/burgers/beef_avacado.png',
        description:
            'A juicy double patty burger stacked with crispy bacon, cheddar cheese, lettuce, and tomato, served in a sesame seed bun.',
        price: 7.99,
        category: FoodCategory.burgers,
        addOns: [
          AddOn(name: 'Extra Bacon', price: 1.50),
          AddOn(name: 'Fried Egg', price: 1.00),
        ]),
    Food(
        name: 'Spicy Jalapeño Burger',
        imagePath: 'assets/food/burgers/halal.png',
        description:
            'A beef patty topped with pepper jack cheese, spicy jalapeños, lettuce, and a chipotle mayo, served in a brioche bun.',
        price: 6.49,
        category: FoodCategory.burgers,
        addOns: [
          AddOn(name: 'Extra Jalapeños', price: 0.50),
          AddOn(name: 'Guacamole', price: 1.00),
        ]),

    // Sides
    Food(
        name: 'Onion Rings',
        imagePath: 'assets/food/sides/onion_rings.png',
        description:
            'Crispy golden onion rings served with a tangy dipping sauce.',
        price: 3.49,
        category: FoodCategory.sides,
        addOns: []),

    Food(
        name: 'Sweet Potato Fries',
        imagePath: 'assets/food/sides/fries.png',
        description:
            'A side of sweet potato fries, lightly seasoned and served with a spicy dipping sauce.',
        price: 3.99,
        category: FoodCategory.sides,
        addOns: []),
    Food(
        name: 'Coleslaw',
        imagePath: 'assets/food/salads/coleslaw.png',
        description:
            'A serving of coleslaw made with finely shredded cabbage and carrots in a creamy dressing.',
        price: 2.99,
        category: FoodCategory.sides,
        addOns: []),

    Food(
      name: 'Garlic Bread',
      imagePath: 'assets/food/sides/mashed_potato.png',
      description:
          'Toasted garlic bread with a buttery, garlicky flavor, served with a sprinkle of parsley.',
      price: 2.49,
      category: FoodCategory.sides,
      addOns: [],
    ),

    // Drinks
    Food(
        name: 'Iced Lemonade',
        imagePath: 'assets/food/drinks/mochitto.png',
        description:
            'A refreshing glass of iced lemonade with lemon slices and mint leaves.',
        price: 2.49,
        category: FoodCategory.drinks,
        addOns: []),
    Food(
        name: 'Iced Coffee',
        imagePath: 'assets/food/drinks/latte.png',
        description:
            'A glass of iced coffee layered with milk, coffee, and ice cubes.',
        price: 2.99,
        category: FoodCategory.drinks,
        addOns: []),
    Food(
        name: 'Orange Smoothie',
        imagePath: 'assets/food/drinks/orange_juice.png',
        description:
            'A vibrant orange smoothie garnished with a slice of orange and a sprig of mint.',
        price: 3.49,
        category: FoodCategory.drinks,
        addOns: []),

    // Salads
    Food(
        name: 'Caesar Salad',
        imagePath: 'assets/food/salads/caesar.png',
        description:
            'Crisp romaine lettuce tossed with Caesar dressing, croutons, and Parmesan cheese.',
        price: 4.99,
        category: FoodCategory.salads,
        addOns: []),
    Food(
        name: 'Greek Salad',
        imagePath: 'assets/food/salads/greek.png',
        description:
            'A traditional Greek salad with tomatoes, cucumbers, olives, feta cheese, and red onions, drizzled with olive oil.',
        price: 5.49,
        category: FoodCategory.salads,
        addOns: []),
    Food(
        name: 'Spinach and Strawberry Salad',
        imagePath: 'assets/food/salads/vinai.png',
        description:
            'Fresh spinach leaves tossed with sliced strawberries, pecans, and a balsamic vinaigrette.',
        price: 5.99,
        category: FoodCategory.salads,
        addOns: []),

    Food(
        name: 'Caprese Salad',
        imagePath: 'assets/food/salads/coleslaw.png',
        description:
            'A classic Caprese salad with fresh mozzarella, tomatoes, and basil, drizzled with balsamic glaze.',
        price: 5.99,
        category: FoodCategory.salads,
        addOns: []),

    // Desserts
    Food(
        name: 'Chocolate Cake',
        imagePath: 'assets/food/desserts/choco.png',
        description:
            'A decadent slice of chocolate cake topped with rich chocolate ganache and a fresh strawberry.',
        price: 3.99,
        category: FoodCategory.desserts,
        addOns: []),
    Food(
        name: 'New York Cheesecake',
        imagePath: 'assets/food/desserts/choco.png',
        description:
            'A rich and creamy slice of New York cheesecake topped with fresh blueberries.',
        price: 4.49,
        category: FoodCategory.desserts,
        addOns: []),
    Food(
        name: 'Apple Pie',
        imagePath: 'assets/food/desserts/pumkin_pie.png',
        description:
            'A classic slice of apple pie with a flaky, golden crust and a scoop of vanilla ice cream.',
        price: 3.99,
        category: FoodCategory.desserts,
        addOns: []),

    Food(
        name: 'Tiramisu',
        imagePath: 'assets/food/desserts/bluberry_foam.png',
        description:
            'A classic Italian dessert with layers of coffee-soaked ladyfingers, mascarpone cheese, and cocoa powder.',
        price: 4.99,
        category: FoodCategory.desserts,
        addOns: []),

    // Soups
    Food(
        name: 'Tomato Basil Soup',
        imagePath: 'assets/food/soup/creamy_tomato_basil.png',
        description:
            'A creamy tomato basil soup garnished with a drizzle of olive oil and fresh basil leaves, served with toasted garlic bread.',
        price: 4.49,
        category: FoodCategory.soup,
        addOns: []),
    Food(
        name: 'Butternut Squash Soup',
        imagePath: 'assets/food/soup/butternet.png',
        description:
            'A vibrant butternut squash soup, topped with a swirl of cream and roasted pumpkin seeds.',
        price: 4.99,
        category: FoodCategory.soup,
        addOns: []),
    Food(
        name: 'Chicken Noodle Soup',
        imagePath: 'assets/food/soup/chicken_noodle.png',
        description:
            'A hearty chicken noodle soup with chunks of chicken, wide egg noodles, and fresh parsley.',
        price: 4.99,
        category: FoodCategory.soup,
        addOns: []),
    Food(
        name: 'Minestrone Soup',
        imagePath: 'assets/food/soup/minestrone.png',
        description:
            'A colorful minestrone soup with various vegetables, pasta, and beans, garnished with Parmesan cheese.',
        price: 5.49,
        category: FoodCategory.soup,
        addOns: []),
  ];

  // GETTERS

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // METHODS

  // user cart
  List<CartItem> _cart = [];

  void addFood(Food food, List<AddOn> addOns) {
    // Finding the cart item that matches the food name and selected add-ons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food.name == food.name;
      bool isSameAddOns = ListEquality().equals(item.selectedAddOns, addOns);
      notifyListeners();
      return isSameFood && isSameAddOns;
    });

    // If the cart item is found, increase the quantity, otherwise add a new item to the cart
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddOns: addOns));
      notifyListeners();
    }
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  // remove food from cart with all quantity
  void removeFood(Food food) {
    _cart.removeWhere((item) => item.food.name == food.name);
    notifyListeners();
  }

  // total price
  double totalPrice() {
    double total = 0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (AddOn addOn in cartItem.selectedAddOns) {
        itemTotal += addOn.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // total items
  int totalItems() {
    int total = 0;
    for (CartItem cartItem in _cart) {
      total += cartItem.quantity;
    }
    return total;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // HELPER METHODS

  bool isFoodInCart(Food food) {
    for (var item in _menu) {
      if (item.name == food.name) {
        return true;
      }
    }
    return false;
  }
}
