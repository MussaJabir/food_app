import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // 🍔 BURGERS
    Food(
      name: 'Classic Cheeseburger',
      description: 'Beef patty, cheddar, lettuce, tomato, and sauce.',
      imageUrl: 'assets/images/burgers/cheeseburger.png',
      price: 8.99,
      category: FoodCategory.burgers,
      addOns: [
        AddOn(name: 'Extra Cheese', price: 1.0),
        AddOn(name: 'Bacon', price: 1.5),
      ],
    ),
    Food(
      name: 'Double Beef Burger',
      description: 'Two beef patties with cheddar and BBQ sauce.',
      imageUrl: 'assets/images/burgers/double_beef.png',
      price: 10.49,
      category: FoodCategory.burgers,
      addOns: [
        AddOn(name: 'Fried Egg', price: 1.0),
        AddOn(name: 'Jalapeños', price: 0.5),
      ],
    ),
    Food(
      name: 'Chicken Burger',
      description: 'Grilled chicken breast, lettuce, and mayo.',
      imageUrl: 'assets/images/burgers/chicken_burger.png',
      price: 7.99,
      category: FoodCategory.burgers,
      addOns: [AddOn(name: 'Cheddar Slice', price: 0.75)],
    ),
    Food(
      name: 'Spicy Beef Burger',
      description: 'Spicy beef patty with chili mayo.',
      imageUrl: 'assets/images/burgers/spicy_beef.png',
      price: 9.25,
      category: FoodCategory.burgers,
      addOns: [AddOn(name: 'Hot Sauce', price: 0.5)],
    ),
    Food(
      name: 'Vegan Burger',
      description: 'Plant-based patty, vegan cheese, lettuce.',
      imageUrl: 'assets/images/burgers/vegan_burger.png',
      price: 8.49,
      category: FoodCategory.burgers,
      addOns: [AddOn(name: 'Gluten-Free Bun', price: 0.75)],
    ),

    // 🥗 SALADS
    Food(
      name: 'Greek Salad',
      description: 'Tomato, cucumber, olives, and feta.',
      imageUrl: 'assets/images/salads/greek_salad.png',
      price: 6.50,
      category: FoodCategory.salads,
      addOns: [AddOn(name: 'Feta Cheese', price: 1.0)],
    ),
    Food(
      name: 'Caesar Salad',
      description: 'Romaine, croutons, parmesan, and dressing.',
      imageUrl: 'assets/images/salads/caesar_salad.png',
      price: 6.99,
      category: FoodCategory.salads,
      addOns: [AddOn(name: 'Grilled Chicken', price: 2.0)],
    ),
    Food(
      name: 'Fruit Salad',
      description: 'Seasonal fresh fruits with mint.',
      imageUrl: 'assets/images/salads/fruit_salad.png',
      price: 5.75,
      category: FoodCategory.salads,
      addOns: [],
    ),
    Food(
      name: 'Quinoa Salad',
      description: 'Quinoa, cherry tomato, avocado, and lemon.',
      imageUrl: 'assets/images/salads/quinoa_salad.png',
      price: 7.50,
      category: FoodCategory.salads,
      addOns: [AddOn(name: 'Boiled Egg', price: 1.0)],
    ),
    Food(
      name: 'Tuna Salad',
      description: 'Lettuce, tuna chunks, olives, and dressing.',
      imageUrl: 'assets/images/salads/tuna_salad.png',
      price: 6.99,
      category: FoodCategory.salads,
      addOns: [AddOn(name: 'Extra Tuna', price: 1.5)],
    ),

    // 🍰 DESSERTS
    Food(
      name: 'Chocolate Cake',
      description: 'Rich chocolate sponge with icing.',
      imageUrl: 'assets/images/deserts/chocolate_cake.png',
      price: 4.50,
      category: FoodCategory.desserts,
      addOns: [AddOn(name: 'Vanilla Ice Cream', price: 1.0)],
    ),
    Food(
      name: 'Strawberry Cheesecake',
      description: 'Creamy cheesecake with strawberry topping.',
      imageUrl: 'assets/images/deserts/cheesecake.png',
      price: 4.99,
      category: FoodCategory.desserts,
      addOns: [],
    ),
    Food(
      name: 'Ice Cream Sundae',
      description: 'Vanilla, chocolate, and caramel layers.',
      imageUrl: 'assets/images/deserts/sundae.png',
      price: 3.99,
      category: FoodCategory.desserts,
      addOns: [AddOn(name: 'Sprinkles', price: 0.5)],
    ),
    Food(
      name: 'Fruit Tart',
      description: 'Pastry base topped with custard and fruits.',
      imageUrl: 'assets/images/deserts/fruit_tart.png',
      price: 4.25,
      category: FoodCategory.desserts,
      addOns: [],
    ),
    Food(
      name: 'Banana Split',
      description: 'Banana, ice cream, syrup, and whipped cream.',
      imageUrl: 'assets/images/deserts/banana_split.png',
      price: 4.75,
      category: FoodCategory.desserts,
      addOns: [],
    ),

    // 🥤 DRINKS
    Food(
      name: 'Iced Lemon Tea',
      description: 'Cool tea with lemon and mint.',
      imageUrl: 'assets/images/drinks/iced_lemon_tea.png',
      price: 1.99,
      category: FoodCategory.drinks,
      addOns: [],
    ),
    Food(
      name: 'Orange Juice',
      description: 'Freshly squeezed orange juice.',
      imageUrl: 'assets/images/drinks/orange_juice.png',
      price: 2.49,
      category: FoodCategory.drinks,
      addOns: [],
    ),
    Food(
      name: 'Coca-Cola',
      description: 'Chilled fizzy drink (330ml).',
      imageUrl: 'assets/images/drinks/coke.png',
      price: 1.25,
      category: FoodCategory.drinks,
      addOns: [],
    ),
    Food(
      name: 'Milkshake',
      description: 'Creamy vanilla milkshake.',
      imageUrl: 'assets/images/drinks/milkshake.png',
      price: 3.25,
      category: FoodCategory.drinks,
      addOns: [AddOn(name: 'Chocolate Syrup', price: 0.5)],
    ),
    Food(
      name: 'Mineral Water',
      description: '500ml bottled mineral water.',
      imageUrl: 'assets/images/drinks/water.png',
      price: 0.99,
      category: FoodCategory.drinks,
      addOns: [],
    ),

    // 🍟 SIDES
    Food(
      name: 'French Fries',
      description: 'Golden fries with ketchup.',
      imageUrl: 'assets/images/sides/fries.png',
      price: 2.50,
      category: FoodCategory.sides,
      addOns: [AddOn(name: 'Cheese Sauce', price: 0.75)],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Crispy fried onion rings.',
      imageUrl: 'assets/images/sides/onion_rings.png',
      price: 2.75,
      category: FoodCategory.sides,
      addOns: [],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: 'Fried mozzarella sticks with marinara.',
      imageUrl: 'assets/images/sides/mozzarella_sticks.png',
      price: 3.00,
      category: FoodCategory.sides,
      addOns: [],
    ),
    Food(
      name: 'Chicken Nuggets',
      description: '6 crispy chicken nuggets.',
      imageUrl: 'assets/images/sides/nuggets.png',
      price: 3.49,
      category: FoodCategory.sides,
      addOns: [AddOn(name: 'BBQ Sauce', price: 0.50)],
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Toasted garlic bread slices.',
      imageUrl: 'assets/images/sides/garlic_bread.png',
      price: 2.25,
      category: FoodCategory.sides,
      addOns: [],
    ),
  ];

  /*
  G E T T E R
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
    O P E R A T I O N S
  */

  // User cart
  final List<CartItem> _cart = [];

  // Add to cart
  void addToCart(Food food, List<AddOn> selectedAddOns) {
    // Check if the food is already in the cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //Check if the food items are the same
      bool isSameFood = item.food == food;
      //Check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddOns,
        selectedAddOns,
      );
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      // If the food is already in the cart, increment the quantity
      cartItem.quantity++;
    } else {
      // If the food is not in the cart, add it
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
    }
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartItemIndex = _cart.indexOf(cartItem);

    if (cartItem.quantity != 1) {
      if (_cart[cartItemIndex].quantity > 1) {
        _cart[cartItemIndex].quantity--;
      } else {
        _cart.removeAt(cartItemIndex);
      }
    }
    notifyListeners();
  }

  //Total price of items in the cart
  double getTotalPrice() {
    double totalPrice = 0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addon in cartItem.selectedAddOns) {
        itemTotal += addon.price;
      }
      totalPrice += itemTotal * cartItem.quantity;
    }
    return totalPrice;
  }

  //Total number of items in the cart
  int getTotalItemsCount() {
    int totalItemsCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemsCount += cartItem.quantity;
    }
    return totalItemsCount;
  }

  //Clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
    H E L P E R S
  */

  //Generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();

    // Header
    receipt.writeln('╔════════════════════════════════╗');
    receipt.writeln('║         🧾 ORDER RECEIPT                 ║');
    receipt.writeln('╚════════════════════════════════╝');
    receipt.writeln();

    // Date
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln('Date: $formattedDate');
    receipt.writeln('-------------------------------');

    // Items
    for (final cartItem in _cart) {
      receipt.writeln('${cartItem.quantity}x ${cartItem.food.name}');
      receipt.writeln('   @ ${_formatPrice(cartItem.food.price)} each');

      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt.writeln('   ➕ Add-ons: ${_formatAddOns(cartItem.selectedAddOns)}');
      }

      receipt.writeln(''); // Blank line between items
    }

    // Footer
    receipt.writeln('-------------------------------');
    receipt.writeln('Total Items : ${getTotalItemsCount()}');
    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');
    receipt.writeln('-------------------------------');
    receipt.writeln('Thank you for your order! 🎉');

    return receipt.toString();
  }

  //Format double value into currency
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  //Format list of Addons into a string summary
  String _formatAddOns(List<AddOn> addOns) {
    return addOns
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }
}
