class RecipeModel {
  final int id;
  final int timeRequired;
  final String title, description;
  final String photo;
  final num rating;
  // final bool isLiked;
  RecipeModel({
    required this.id,
    required this.timeRequired,
    required this.title,
    required this.description,
    required this.photo,
    required this.rating,
    // required this.isLiked
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      photo: json['photo'],
      title: json['title'],
      description: json['description'],
      timeRequired: json['timeRequired'],
      rating: json['rating'],
      // isLiked: json['isLiked'] ?? false
    );
  }
}
