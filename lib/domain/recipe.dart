// lib/domain/models/recipe.dart
import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final int cookingTime; // in minutes
  final Difficulty difficulty;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cookingTime,
    required this.difficulty,
    required this.ingredients,
    required this.steps,
  });

  String get formattedTime {
    if (cookingTime < 60) return '$cookingTime min';
    final hours = cookingTime ~/ 60;
    final minutes = cookingTime % 60;
    return '${hours}h ${minutes}min';
  }
}

enum Difficulty { easy, medium, hard }

extension DifficultyExtension on Difficulty {
  String get displayName {
    switch (this) {
      case Difficulty.easy:
        return 'Easy';
      case Difficulty.medium:
        return 'Medium';
      case Difficulty.hard:
        return 'Hard';
    }
  }

  Color get color {
    switch (this) {
      case Difficulty.easy:
        return Colors.green;
      case Difficulty.medium:
        return Colors.orange;
      case Difficulty.hard:
        return Colors.red;
    }
  }
}