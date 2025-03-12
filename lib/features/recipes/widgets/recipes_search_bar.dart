import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RecipesSearchBar extends StatelessWidget {
  const RecipesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SearchAnchor.bar(
      barHintText: "Search for recipes",
      barElevation: WidgetStatePropertyAll(0.2),
      barSide: WidgetStatePropertyAll(
        BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      barLeading: Icon(
        IconsaxPlusLinear.search_normal,
      ),
      viewBackgroundColor: theme.colorScheme.surfaceContainerLowest,
      barBackgroundColor: WidgetStatePropertyAll(
        theme.colorScheme.surfaceContainerLowest,
      ),
      suggestionsBuilder: (context, controller) {
        return [];
      },
    );
  }
}
