import 'package:flutter/material.dart';

class CustomDescriptionBox extends StatelessWidget {
  const CustomDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Text Style
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return  Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(25.0),
      margin: EdgeInsets.only(bottom: 25.0, right: 25.0, left: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Delivery fee
          Column(
            children: [
              Text('\$00', style: myPrimaryTextStyle),
              Text('Delivery Fee', style: mySecondaryTextStyle)
            ],
          ),

          //delivery item
          Column(
            children: [
              Text('15-30 min', style: myPrimaryTextStyle),
              Text('Delivery time', style: mySecondaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
