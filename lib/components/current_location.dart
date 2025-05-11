import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Your Location'),
            content: TextField(
              decoration: InputDecoration(hintText: 'Search Address..'),
            ),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(
                  'Current Location',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
