import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:cooking_book/features/favorites/pages/see_more_favorite_recipes.dart';
import 'package:cooking_book/features/recipes/pages/recipe_details_page.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';

class FavoriteRecipeCard extends StatelessWidget {
  const FavoriteRecipeCard({
    super.key,
    required this.category,
    required this.theme,
    required this.receips,
  });

  final String category;
  final ThemeData theme;
  final List<CompleateRecipe> receips;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: theme.textTheme.titleLarge,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeMoreFavoriteRecipes(
                          category: category,
                          recipes: receips,
                        ),
                      ),
                    );
                  },
                  child: Text("See more"))
            ],
          ),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(
                          recipe: receips.first,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: CachedNetworkImage(
                      imageUrl: receips.first.imageUrl,
                      placeholder: (context, url) => Spinner(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            final recipe =
                                receips.length > 1 ? receips[1] : receips.first;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetailsPage(
                                  recipe: recipe,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: CachedNetworkImage(
                              width: double.maxFinite,
                              imageUrl: receips.length > 1
                                  ? receips[1].imageUrl
                                  : receips.first.imageUrl,
                              placeholder: (context, url) => Spinner(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                final recipe = receips.length > 2
                                    ? receips[2]
                                    : receips.first;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeDetailsPage(
                                      recipe: recipe,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: CachedNetworkImage(
                                  width: double.maxFinite,
                                  imageUrl: receips.length > 2
                                      ? receips[2].imageUrl
                                      : receips.first.imageUrl,
                                  placeholder: (context, url) => Spinner(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (receips.length > 3)
                              Positioned(
                                top: 4,
                                left: 4,
                                right: 4,
                                bottom: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SeeMoreFavoriteRecipes(
                                          category: category,
                                          recipes: receips,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.black45,
                                    ),
                                    child: Text(
                                      "+ ${receips.length - 3}\n Recipes",
                                      textAlign: TextAlign.center,
                                      style:
                                          theme.textTheme.titleLarge?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
