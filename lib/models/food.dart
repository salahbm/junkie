class Food {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final FoodCategory category;
  final List<AddOn> addOns;

  Food(this.name, this.imagePath, this.description, this.price, this.category,
      this.addOns);
}

// Food categories

enum FoodCategory { burgers, sides, drinks, desserts, salads, soup, specials }

// Foods addons
class AddOn {
  final String name;
  final double price;
  AddOn(this.name, this.price);
}
