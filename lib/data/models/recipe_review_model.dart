import '../../recipe_detail/data/model/user_model.dart';

class ReviewsRecipeModel {
  final int id;
  final String title;
  final String image;
  final int reviewsCount;
  final num rating;
  final UserModel user;

  ReviewsRecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.reviewsCount,
    required this.rating,
    required this.user,
  });

  factory ReviewsRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewsRecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['photo'],
      reviewsCount: json['reviewsCount'],
      rating: json['rating'],
      user: UserModel.fromJson(json['user']),
    );
  }
}