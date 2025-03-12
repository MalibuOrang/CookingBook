import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:cooking_book/service/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_details_provider.g.dart';

@riverpod
Future<CompleateRecipe?> recipeDetails(Ref ref, String mealId) async {
  final url = "https://themealdb.com/api/json/v1/1/lookup.php?i=$mealId";
  final response = await dio.get(url);
  if (response.statusCode == 200) {
    final data = response.data['meals'][0];
    return CompleateRecipe.fromJson(data);
  }
  return null;
}
