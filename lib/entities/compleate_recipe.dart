import 'package:cooking_book/entities/ingredient.dart';
import 'package:cooking_book/entities/recipe_category.dart';

class CompleateRecipe extends RecipeCategory {
  final String category;
  final String area;
  final String instruction;
  final List<Ingredient> ingredients;
  final String youtubeUrl;
  final List<String> tags;
  CompleateRecipe({
    required this.category,
    required this.area,
    required this.instruction,
    required this.ingredients,
    required this.youtubeUrl,
    required this.tags,
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CompleateRecipe.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredients = [];
    List<String> tags = [];
    //extract ingredients
    for (int i = 0; i <= 20; i++) {
      String? name = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];
      if (name != null &&
          name.isNotEmpty &&
          measure != null &&
          measure.isNotEmpty) {
        ingredients.add(
          Ingredient(
            name: name,
            measure: measure,
            imageUrl:
                'https://themealdb.com/images/ingredients/$name-small.png',
          ),
        );
      }
    }
    // extract tags
    String? tempTags = json['strTags'];
    if (tempTags != null && tempTags.isNotEmpty) {
      tags = tempTags
          .split(',')
          .map((String tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();
    }
    return CompleateRecipe(
      id: json['idMeal'] as String,
      name: json['strMeal'] as String,
      imageUrl: json['strMealThumb'] as String,
      category: json['strCategory'] as String,
      area: json['strArea'] as String,
      instruction: json['strInstructions'] as String,
      ingredients: ingredients,
      youtubeUrl: json['strYoutube'] as String,
      tags: tags,
    );
  }
  factory CompleateRecipe.fromBookmark(Map<String, dynamic> json) {
    return CompleateRecipe(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      category: json['category'] as String,
      area: json['area'] as String,
      instruction: json['instructions'] as String,
      ingredients: json['ingredients']
          .map<Ingredient>((e) => Ingredient.fromJson(e))
          .toList(),
      youtubeUrl: json['youtubeUrl'] as String,
      tags: json['tags'].map<String>((e) => e.toString()).toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": imageUrl,
      "category": category,
      "area": area,
      "instructions": instruction,
      "ingredients": ingredients.map((e) => e.toJson()).toList(),
      "youtubeUrl": youtubeUrl,
      "tags": tags,
    };
  }
}
