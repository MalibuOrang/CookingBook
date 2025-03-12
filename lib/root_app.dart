import 'package:cooking_book/features/favorites/pages/favorites_page.dart';
import 'package:cooking_book/features/recipes/pages/recipes_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 0;
  final pages = [
    RecipesPage(),
    FavoritesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.home),
            selectedIcon: Icon(IconsaxPlusBold.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.bookmark),
            selectedIcon: Icon(IconsaxPlusBold.bookmark),
            label: 'Favorites',
          ),
        ],
        selectedIndex: currentIndex,
      ),
      body: pages[currentIndex],
    );
  }
}
