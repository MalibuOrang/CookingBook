import 'package:cooking_book/features/recipes/widgets/recipes_card.dart';
import 'package:cooking_book/providers/random_recipe_provider.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularRecipes extends ConsumerWidget {
  const PopularRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(randomRecipeProvider(14));
    return recipes.when(
      data: (data) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
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
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          'Error: $error',
        ),
      ),
      loading: () => Spinner(),
    );
  }
}
