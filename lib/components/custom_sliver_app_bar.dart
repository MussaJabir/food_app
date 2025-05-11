import 'package:flutter/material.dart';

import '../screens/cart_page.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const CustomSliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 60,
      floating: true,
      pinned: true,
      actions: [
        IconButton(
          onPressed:
              () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text('Sunset Dinner'),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(right: 0, left: 0, top: 10),
        expandedTitleScale: 1,
      ),
    );
  }
}
