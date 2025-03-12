import 'package:cooking_book/features/recipes/widgets/popular_recipes.dart';
import 'package:cooking_book/features/recipes/widgets/recipes_categories.dart';
import 'package:cooking_book/features/recipes/widgets/recipes_search_bar.dart';
import 'package:cooking_book/features/recipes/widgets/recomended_reciepes.dart';
import 'package:cooking_book/features/recipes/widgets/see_more_recipes.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, cook🧑‍🍳",
              style: theme.textTheme.bodyLarge,
            ),
            Text(
              "Got a tasty dish in mind?",
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          RecipesSearchBar(),
          SizedBox(height: 20),
          Text(
            "Categories",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          RecipesCategories(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recomended for you",
                  style: theme.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeMoreRecipes(),
                      ),
                    );
                  },
                  child: Text("See more"),
                )
              ],
            ),
          ),
          RecomendedReciepes(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recipes of the week",
                  style: theme.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeMoreRecipes(),
                      ),
                    );
                  },
                  child: Text("See more"),
                )
              ],
            ),
          ),
          PopularRecipes(),
        ],
      ),
    );
  }
}
