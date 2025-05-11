import 'package:flutter/material.dart';
import 'package:food_app/components/custom_quantity_selector.dart';
import 'package:food_app/models/food.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import '../models/restaurant.dart';

class CustomCartTile extends StatelessWidget {
  final CartItem cartItem;

  const CustomCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:
          (context, restaurant, child) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Food Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.imageUrl,
                          width: 80,
                          height: 80,
                        ),
                      ),
                      SizedBox(width: 10),

                      //name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Text(cartItem.food.name),
                          //Price
                          Text('\$${cartItem.food.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          ),),
                        ],
                      ),

                      Spacer(),
                      //Increment or decrement quantity
                      CustomQuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onIncrement: () {
                          restaurant.addToCart(
                            cartItem.food,
                            cartItem.selectedAddOns,
                          );
                        },
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                      ),
                    ],
                  ),
                ),

                //Addons
                SizedBox(
                  height: cartItem.selectedAddOns.isNotEmpty ? 50 : 0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    children:
                        cartItem.selectedAddOns
                            .map(
                              (addon) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      //Addon name
                                      Text(addon.name),
                                      //Addon price
                                      Text(
                                        '(\$${addon.price.toStringAsFixed(2)})',
                                        style: TextStyle(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),

                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.inversePrimary,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
