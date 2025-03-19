import 'package:chef_staff/data/models/review_user_model.dart';

class RecipeReviewCommentsModel {
  final int id;
  final num  rating;
  final String comment;
  final String image;
  final DateTime created;
  final ReviewsUserModel user;

  RecipeReviewCommentsModel({
    required this.id,
    required this.rating,
    required this.image,
    required this.user,
    required this.created,
    required this.comment,
  });

  factory RecipeReviewCommentsModel.fromJson(Map<String, dynamic> json) {
    return RecipeReviewCommentsModel(
        id: json['id'],
        rating: json['rating'],
        image: json['image'],
        user: ReviewsUserModel.fromJson(json['user']),
        created: DateTime.parse(json['created']),
        comment: json['comment']);
  }
}

