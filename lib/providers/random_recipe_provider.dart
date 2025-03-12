import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:cooking_book/service/network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'random_recipe_provider.g.dart';

@riverpod
FutureOr<List<CompleateRecipe>> randomRecipe(Ref ref, [int count = 10]) async {
  final responses = await Future.wait(
    List.generate(
      count,
      (_) => dio.get('/random.php'),
    ),
  );
  if (responses.every((response) => response.statusCode == 200)) {
    return responses
        .map((response) => CompleateRecipe.fromJson(response.data['meals'][0]))
        .toList();
  } else if (responses.every((response) => response.statusCode != 200)) {
    throw Exception('Failed to fetch recipes');
  }
  return [];
}
