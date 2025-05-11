import 'package:flutter/material.dart';
import 'package:food_app/auth/login_or_register.dart';
import 'package:food_app/screens/login_page.dart';
import 'package:food_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'models/restaurant.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        //For  Theme
        ChangeNotifierProvider(
            create: (context) => ThemeProvider(),),

        //For Restaurant
        ChangeNotifierProvider(
            create: (context) => Restaurant(),),
      ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

