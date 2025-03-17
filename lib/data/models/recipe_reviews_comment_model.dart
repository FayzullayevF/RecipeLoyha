class ReviewsUserModel {
  ReviewsUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
  });

  final int id;
  final String profilePhoto;
  final String username;

  factory ReviewsUserModel.fromJson(Map<String, dynamic> json) {
    return ReviewsUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
    );
  }
}
