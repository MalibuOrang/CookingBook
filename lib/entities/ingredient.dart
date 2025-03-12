class Ingredient {
  final String name;
  final String measure;
  final String imageUrl;

  Ingredient({
    required this.name,
    required this.measure,
    required this.imageUrl,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'] as String,
      measure: json['measure'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'measure': measure,
      'imageUrl': imageUrl,
    };
  }
}
