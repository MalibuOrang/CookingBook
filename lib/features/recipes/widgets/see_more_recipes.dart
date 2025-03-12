import 'package:cooking_book/features/recipes/widgets/recipes_card.dart';
import 'package:cooking_book/providers/random_recipe_provider.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeMoreRecipes extends ConsumerWidget {
  const SeeMoreRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(randomRecipeProvider(30));
    return Scaffold(
      appBar: AppBar(
        title: Text('More Recipes For You'),
      ),
      body: recipes.when(
        data: (data) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final recipe = data[index];
              return RecipesCard(
                imageUrl: recipe.imageUrl,
                name: recipe.name,
                onTap: () {},
              );
            },
            itemCount: data.length,
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => Spinner(),
      ),
    );
  }
}
