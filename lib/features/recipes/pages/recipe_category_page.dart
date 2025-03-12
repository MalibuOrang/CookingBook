import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_book/entities/recipe_category.dart';
import 'package:cooking_book/features/recipes/pages/recipe_details_page.dart';
import 'package:cooking_book/features/recipes/widgets/recipes_card.dart';
import 'package:cooking_book/providers/recipe_details_provider.dart';
import 'package:cooking_book/providers/recipes_by_category_provider.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeCategoryPage extends ConsumerWidget {
  final RecipeCategory recipeCategory;
  const RecipeCategoryPage({
    super.key,
    required this.recipeCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipesByCategoryProvider(recipeCategory.name));
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeCategory.name),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Hero(
              tag: recipeCategory.id,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage:
                    CachedNetworkImageProvider(recipeCategory.imageUrl),
              ),
            ),
          )
        ],
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
                onTap: () async {
                  try {
                    final data =
                        await ref.read(recipeDetailsProvider(recipe.id).future);
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(recipe: data!),
                      ),
                    );
                  } catch (e) {
                    log(e.toString());
                  }
                },
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
