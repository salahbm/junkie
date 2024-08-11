class Food {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final FoodCategory category;
  final List<AddOn> addOns;

  Food({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
    required this.addOns,
  });
}

// Food categories

enum FoodCategory { burgers, sides, drinks, desserts, salads, soup, specials }

// Foods addons
class AddOn {
  final String name;
  final double price;
  AddOn({required this.name, required this.price});
}
