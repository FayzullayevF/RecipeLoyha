
import 'package:chef_staff/data/models/recipe_review_model.dart';
import 'package:chef_staff/data/models/review_user_model.dart';

class ReviewModel {
  final int id;
  final String comment;
  final int rating;
  final ReviewsUserModel user;
  final DateTime created;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.rating,
    required this.user,
    required this.created,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      rating: json['rating'],
      user: ReviewsUserModel.fromJson(json['user']),
      created: DateTime.parse(json['created']),
    );
  }
}