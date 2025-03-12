import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:cooking_book/features/recipes/pages/recipe_details_page.dart';
import 'package:cooking_book/features/recipes/widgets/recipes_card.dart';
import 'package:flutter/material.dart';

class SeeMoreFavoriteRecipes extends StatelessWidget {
  const SeeMoreFavoriteRecipes({
    super.key,
    required this.category,
    required this.recipes,
  });
  final String category;
  final List<CompleateRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipesCard(
            name: recipe.name,
            imageUrl: recipe.imageUrl,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailsPage(
                    recipe: recipe,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
