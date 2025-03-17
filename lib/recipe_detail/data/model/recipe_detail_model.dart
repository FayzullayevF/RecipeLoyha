import 'package:chef_staff/recipe_detail/data/model/user_model.dart';

import 'ingredient.dart';
import 'instructions.dart';

class RecipeDetailModel {
  final int id, categoryId;
  final String title, description;
  final String image, videoRecipe;

  final int timeRequired;
  final num rating;
  final UserModel user;
  final List<Ingredient> ingredients;
  final List<Instructions> instructions;

  RecipeDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.image,
    required this.videoRecipe,
    required this.timeRequired,
    required this.rating,
    required this.user,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      image: json['photo'],
      videoRecipe: json['videoRecipe'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      user: UserModel.fromJson(json['user']),
      ingredients: (json['ingredients'] as List<dynamic>).map((ingredient) => Ingredient.fromJson(ingredient)).toList(),
      instructions: (json['instructions'] as List<dynamic>).map((instruction) => Instructions.fromJson(instruction)).toList(),
    );
  }
}