import 'package:fitness/domain/ingredient.dart';

class Fridge {
  final List<Ingredient> _ingredients;

  Fridge({List<Ingredient> ingredients = const []})
    : _ingredients = List.from(ingredients);

  List<Ingredient> get ingredients => List.unmodifiable(_ingredients);

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  void removeIngredientByName(String ingredientName) {
    _ingredients.removeWhere((ingredient) => ingredient.name == ingredientName);
  }

  Ingredient? getIngredientByName(String name) {
    try {
      return _ingredients.firstWhere((ingredient) => ingredient.name == name);
    } catch (e) {
      return null;
    }
  }
}
