class UserModels {
  final String firstname, lastname, username, phoneNumber, password,email;
  final DateTime dateOfBirth;

  UserModels({
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth
  });

  Map<String, dynamic> toJson(){
    return {
      "username": username,
      "firstname": firstname,
      "lastname": lastname,
      "password": password,
      "phoneNumber": phoneNumber,
      "email": email,
      "dateOfBirth": "${dateOfBirth.year}-${dateOfBirth.month}-${dateOfBirth.day}"
    };
  }
}
