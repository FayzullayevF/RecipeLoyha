class UserModel {
  final int id;
  final String profilePhoto;
  final String username, firstname, lastname;

  UserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstname,
    required this.lastname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        profilePhoto: json['profilePhoto'],
        username: json['username'],
        firstname: json['firstName'],
        lastname: json['lastName']);
  }
}
