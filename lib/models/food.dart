class Food {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final List<AddOn> addOns;
  final FoodCategory category;

  Food({
    required this.addOns,
    required this.category,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

// Food categories

enum FoodCategory { burgers, salads, desserts, drinks, sides }

class AddOn {
  String name;
  double price;

  AddOn({required this.name, required this.price});
}
