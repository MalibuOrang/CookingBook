import 'package:cooking_book/entities/recipe_category.dart';
import 'package:cooking_book/service/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipes_categories_provider.g.dart';

@riverpod
Future<List<RecipeCategory>> recipeCategories(Ref ref) async {
  final response = await dio.get('/categories.php');
  if (response.statusCode != 200) {
    throw Exception('Failed to load categories: ${response.statusMessage}');
  }
  final data = response.data['categories'];
  return List.from(data)
      .map((category) => RecipeCategory.fromJson(category))
      .toList();
}
