import 'package:flutter/material.dart';
import 'package:food_app/components/custom_button.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOns = {};

  FoodPage({super.key, required this.food}) {
    for (AddOn addon in food.addOns) {
      selectedAddOns[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<AddOn, bool> selectedAddOns) {
    //Close the food page and go back
    Navigator.pop(context);

    List<AddOn> selectedAddOnList = [];
    for (AddOn addon in widget.food.addOns) {
      if (widget.selectedAddOns[addon] == true) {
        selectedAddOnList.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, selectedAddOnList);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Food image
                Image.asset(widget.food.imageUrl),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //Food price
                      Text(
                        '\$ ${widget.food.price.toString()}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),

                      //Food description
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(color: Theme.of(context).colorScheme.secondary),
                      Text(
                        'AddOns',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      //Addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.addOns.length,
                          itemBuilder: (context, index) {
                            AddOn addon = widget.food.addOns[index];
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$ ${addon.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddOns[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddOns[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddOns),
                    text: 'Add to cart'),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
        //Back Button
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: EdgeInsets.only(left: 25.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
