import 'package:fitness/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/recipes.dart';
import 'pages/fridgePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug ribbon top right
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/recipes': (context) => RecipesPage(),
        '/fridge': (context) => FridgePage(),
      },
    );
  }
}
