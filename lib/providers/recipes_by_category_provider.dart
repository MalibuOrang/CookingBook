import 'package:cooking_book/entities/basic_recipe.dart';
import 'package:cooking_book/service/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_by_category_provider.g.dart';

@riverpod
Future<List<BasicRecipe>> recipesByCategory(Ref ref, String category) async {
  final url = "https://themealdb.com/api/json/v1/1/filter.php?c=$category";
  final response = await dio.get(url);
  if (response.statusCode == 200) {
    final data = response.data['meals'];
    return List.from(data).map((e) => BasicRecipe.fromMap(e)).toList();
  } else if (response.statusCode != 200) {
    throw Exception(
        'Failed to fetch recipes by category: ${response.statusMessage}');
  }
  return [];
}
