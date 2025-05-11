import 'package:flutter/material.dart';
import '../models/food.dart';

class CustomFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const CustomFoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\$ ${food.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 15,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(food.imageUrl, height: 100, width: 100),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.primary,
        endIndent: 25,
        indent: 25,)
      ],
    );
}
}
