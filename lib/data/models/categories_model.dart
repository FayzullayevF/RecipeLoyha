class CategoriesModel {
  final int id;
  final String title;
  final String image;
  final bool main;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.main,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      main: json['main'] as bool,
    );
  }
}
