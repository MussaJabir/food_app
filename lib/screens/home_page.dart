import 'package:flutter/material.dart';
import 'package:food_app/components/current_location.dart';
import 'package:food_app/components/custom_drawer.dart';
import 'package:food_app/components/custom_food_tile.dart';
import 'package:food_app/components/custom_sliver_app_bar.dart';
import 'package:food_app/components/custom_tab_bar.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/screens/food_page.dart';
import 'package:provider/provider.dart';

import '../components/custom_description_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //Sort out and return a list of food items based on the selected category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //Return a list of food in given category
  List<Widget> getFoodInCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return CustomFoodTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)),
              );
            },
            food: food,
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              CustomSliverAppBar(
                title: CustomTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    //Current location
                    CurrentLocation(),

                    // description box
                    CustomDescriptionBox(),
                  ],
                ),
              ),
            ],
        body: Consumer<Restaurant>(
          builder:
              (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInCategory(restaurant.menu),
              ),
        ),
      ),
    );
  }
}
