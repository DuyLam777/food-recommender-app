import 'package:fitness/domain/recipe.dart';

// !!This is a test class for referecne later on

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes();
  Future<List<Recipe>> getRecipesByIngredients(List<String> ingredients);
  Future<Recipe> getRecipeById(String id);
}