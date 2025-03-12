import 'package:cooking_book/features/favorites/widgets/favourite_recipe_card.dart';
import 'package:cooking_book/providers/bookmarks_provider.dart';
import 'package:cooking_book/service/extensions.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: bookmarks.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image/recipe-book.png",
                    width: 300,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No favorite yet",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }
          final groupedBookmarks =
              data.groupBy((bookmark) => bookmark.category);
          return ListView(
            padding: EdgeInsets.all(16),
            children: groupedBookmarks.entries.map((e) {
              final category = e.key;
              final receips = e.value;
              return FavoriteRecipeCard(
                category: category,
                theme: theme,
                receips: receips,
              );
            }).toList(),
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
