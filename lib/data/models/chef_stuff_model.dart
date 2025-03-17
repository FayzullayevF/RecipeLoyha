class ChefStuffModel {
  final int id;
  final String fullName, username, bio;
  final String profilePhoto;
  final int recipes, following, followers;

  ChefStuffModel({
    required this.id,
    required this.fullName,
    required this.username,
    required this.bio,
    required this.profilePhoto,
    required this.recipes,
    required this.following,
    required this.followers,
  });

  factory ChefStuffModel.fromJson(Map<String, dynamic> json) {
    return ChefStuffModel(
      id: json['id'],
      fullName: json['fullName'],
      username: json['username'],
      bio: json['presentation'],
      profilePhoto: json['profilePhoto'],
      recipes: json['recipesCount'],
      following: json['followingCount'],
      followers: json['followerCount'],
    );
  }
}