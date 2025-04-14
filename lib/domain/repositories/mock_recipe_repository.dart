import 'package:fitness/domain/recipe.dart';
// import 'package:flutter/material.dart';
import '../../domain/repositories/recipe_repository.dart';

class MockRecipeRepository implements RecipeRepository {
  @override
  Future<List<Recipe>> getAllRecipes() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      Recipe(
        id: '1',
        title: 'Spaghetti Carbonara',
        imageUrl: 'assets/placeholder_food1.jpg',
        cookingTime: 25,
        difficulty: Difficulty.medium,
        ingredients: ['Pasta', 'Eggs', 'Bacon', 'Parmesan'],
        steps: ['Boil pasta', 'Fry bacon', 'Mix eggs with cheese', 'Combine all'],
      ),
      Recipe(
        id: '2',
        title: 'Vegetable Stir Fry',
        imageUrl: 'assets/placeholder_food1.jpg',
        cookingTime: 15,
        difficulty: Difficulty.easy,
        ingredients: ['Mixed vegetables', 'Soy sauce', 'Garlic', 'Oil'],
        steps: ['Chop vegetables', 'Heat oil', 'Stir fry vegetables', 'Add sauce'],
      ),
      Recipe(
        id: '3',
        title: 'Chicken Curry',
        imageUrl: 'assets/placeholder_food1.jpg',
        cookingTime: 40,
        difficulty: Difficulty.medium,
        ingredients: ['Chicken', 'Curry paste', 'Coconut milk', 'Vegetables'],
        steps: ['Brown chicken', 'Add paste', 'Add coconut milk', 'Simmer'],
      ),
      Recipe(
        id: '4',
        title: 'Chocolate Cake',
        imageUrl: 'assets/placeholder_food1.jpg',
        cookingTime: 60,
        difficulty: Difficulty.hard,
        ingredients: ['Flour', 'Sugar', 'Eggs', 'Cocoa', 'Butter'],
        steps: ['Mix dry ingredients', 'Cream butter and sugar', 'Combine', 'Bake'],
      ),
    ];
  }

  @override
  Future<Recipe> getRecipeById(String id) async {
    final recipes = await getAllRecipes();
    return recipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  Future<List<Recipe>> getRecipesByIngredients(List<String> ingredients) {
    // Implementation would filter recipes by ingredients
    throw UnimplementedError();
  }
}