import 'package:cooking_book/features/recipes/pages/recipe_category_page.dart';
import 'package:cooking_book/providers/recipes_categories_provider.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipesCategories extends ConsumerWidget {
  const RecipesCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(recipeCategoriesProvider);
    return categories.when(
      data: (data) {
        return SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final category = data[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeCategoryPage(recipeCategory: category),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 80,
                        child: Card.filled(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CachedNetworkImage(
                              imageUrl: category.imageUrl,
                              placeholder: (context, url) => Spinner(),
                              errorWidget: (context, url, error) => Center(
                                child: Icon(Icons.error_outline_rounded),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(category.name),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
          ),
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
