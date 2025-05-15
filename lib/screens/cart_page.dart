import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:food_app/screens/payment_page.dart';
import 'package:provider/provider.dart';

import '../components/custom_cart_tile.dart';
import '../models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;
        //Scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text(
                            'Are you sure you want to clear the cart?',
                          ),
                          actions: [
                            //Cancel button
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),

                            //Yes button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              //list of cart items
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(child: Center(child: Text('Cart is empty')))
                        : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              //cart tile
                              final cartItem = userCart[index];
                              //return cart tile ui
                              return CustomCartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                  ],
                ),
              ),

              //Button to pay
              CustomButton(
                text: 'Go to checkout',
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage()),
                    ),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
