import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class CustomReceipt extends StatelessWidget {
  const CustomReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.0,
        bottom: 25.0,
        right: 25.0,
        top: 25.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank You for your order'),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Consumer<Restaurant>(
                builder:
                    (context, restaurant, child) =>
                        Text(restaurant.displayCartReceipt()),
              ),
            ),
            SizedBox(height: 25,),
            Text('Estimated time of arrival : 20 minutes')
          ],
        ),
      ),
    );
  }
}
