// lib/presentation/pages/recipes_page.dart
import 'package:fitness/domain/recipe.dart';
import 'package:fitness/domain/repositories/mock_recipe_repository.dart';
import 'package:fitness/presentation/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/recipe_repository.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late final RecipeRepository _recipeRepository;
  late Future<List<Recipe>> _recipesFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _recipeRepository = MockRecipeRepository();
    _recipesFuture = _recipeRepository.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<Recipe>>(
          future: _recipesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No recipes found'));
            }

            final recipes = snapshot.data!;
            final filteredRecipes = _searchQuery.isEmpty
                ? recipes
                : recipes.where((recipe) =>
                    recipe.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

            return Column(
              children: [
                _buildSearchBar(),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = filteredRecipes[index];
                      return RecipeCard(
                        recipe: recipe,
                        onTap: () => _navigateToRecipeDetail(recipe),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search recipes...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Recipes'),
          content: const Text('Filter options would go here'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToRecipeDetail(Recipe recipe) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => RecipeDetailPage(recipe: recipe),
    //   ),
    // );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected: ${recipe.title}')),
    );
  }
}