import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logger = Logger();

  // Ontap logic for burger menu icon
  void _onBurgerMenuTap() {
    // Log the event
    logger.i('Burger menu icon tapped');
  }

  // Ontap logic for search icon
  void _onSearchTap() {
    // Log the event
    logger.i('Search icon tapped');
    // Implement search logic here
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Recipes recommender',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: _onBurgerMenuTap,
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/burger-menu.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: _onSearchTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar());
  }
}
