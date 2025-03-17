import 'package:chef_staff/recipe_detail/data/model/user_model.dart';

class RecipeCommunityModel {
  final int id, timeRequired, reviewsCount;
  final String title, description;
  final String photo;
  final num rating;
  final String created;
  final UserModel user;

  RecipeCommunityModel(
      {required this.id,
      required this.timeRequired,
      required this.reviewsCount,
      required this.title,
      required this.description,
      required this.photo,
      required this.rating,
      required this.created,
      required this.user});

  factory RecipeCommunityModel.fromJson(Map<String, dynamic> json) {
    return RecipeCommunityModel(
      id: json['id'],
      timeRequired: json['timeRequired'],
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      rating: json['rating'],
      created: json['created'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
