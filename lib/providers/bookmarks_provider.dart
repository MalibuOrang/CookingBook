import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bookmarks_provider.g.dart';

@riverpod
class Bookmarks extends _$Bookmarks {
  final _storage = GetStorage();

  @override
  FutureOr<List<CompleateRecipe>> build() {
    final meals = _storage.getValues() ?? [];
    return List.from(meals)
        .map((meal) => CompleateRecipe.fromBookmark(meal))
        .toList();
  }

  void add(CompleateRecipe meal) {
    _storage.write(meal.id, meal.toJson());
    ref.invalidateSelf();
  }

  void remove(String id) {
    _storage.remove(id);
    ref.invalidateSelf();
  }

  bool isBookmarked(String id) {
    return _storage.hasData(id);
  }
}
