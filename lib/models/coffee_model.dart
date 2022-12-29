import 'package:equatable/equatable.dart';

class CoffeeModel extends Equatable {
  const CoffeeModel({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  final String title;
  final String description;
  final List<dynamic> ingredients;
  final String image;
  final dynamic id;

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => CoffeeModel(
        title: json["title"],
        description: json["description"],
        ingredients: List<dynamic>.from(json["ingredients"].map((x) => x)),
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "image": image,
        "id": id,
      };

  @override
  List<Object?> get props => [title, description, ingredients, image, id];
}
