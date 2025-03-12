import 'package:cooking_book/features/recipes/pages/recipe_details_page.dart';
import 'package:cooking_book/features/recipes/widgets/recipes_card.dart';
import 'package:cooking_book/providers/random_recipe_provider.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecomendedReciepes extends ConsumerWidget {
  const RecomendedReciepes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(randomRecipeProvider());
    return SizedBox(
      height: 200,
      child: recipes.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final recipe = data[index];
              return SizedBox(
                width: 180,
                child: RecipesCard(
                  imageUrl: recipe.imageUrl,
                  name: recipe.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 12,
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(
            'Error: $error',
          ),
        ),
        loading: () => Spinner(),
      ),
    );
  }
}
