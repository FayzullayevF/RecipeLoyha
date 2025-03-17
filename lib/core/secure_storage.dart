import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const tokenKey = 'accessToken';
  static const loginKey = 'login';
  static const passwordKey = 'password';
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  static Future<void> saveCredentials(
      {required String login, required String password}) async {
    await _storage.write(key: loginKey, value: login);
    await _storage.write(key: passwordKey, value: password);
  }

static Future<String?> getToken() async {
  return await _storage.read(key: tokenKey); 
}


  static Future<Map<String, String?>> getCredentials() async {
    var rawCredential = {
      'login': await _storage.read(key: loginKey),
      'password': await _storage.read(key: passwordKey)
    };
    return rawCredential;
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: tokenKey);
  }

  static Future<void> deleteCredentials() async {
    await _storage.delete(key: loginKey);
    await _storage.delete(key: passwordKey);
  }
}

class SignUpSecureStorage {
  static const tokenKey = 'accessToken';
  static const passwordKey = 'password';
  static const firstNameKey = 'firstName';
  static const lastNameKey = 'lastName';
  static const usernameKey = 'username';
  static const emailKey = 'email';
  static const phoneNumberKey = 'phoneNumber';
  static const birthDateKey = 'dateOfBirth';
  static const _signUpStorage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _signUpStorage.write(key: tokenKey, value: token);
  }

  static Future<void> saveCredentials({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNumber,
    required String birthDate,
    required String password,
  }) async {
    await _signUpStorage.write(key: firstNameKey, value: firstName);
    await _signUpStorage.write(key: lastNameKey, value: lastName);
    await _signUpStorage.write(key: usernameKey, value: username);
    await _signUpStorage.write(key: emailKey, value: email);
    await _signUpStorage.write(key: phoneNumberKey, value: phoneNumber);
    await _signUpStorage.write(key: birthDateKey, value: birthDate);
    await _signUpStorage.write(key: passwordKey, value: password);

  }

  static Future<void> getToken() async {
    await _signUpStorage.read(key: tokenKey);
  }

  static Future<Map<String, String?>> getCredentials() async {
    var rawCredential = {
      'fullName': await _signUpStorage.read(key: firstNameKey),
      'username': await _signUpStorage.read(key: usernameKey),
      'email': await _signUpStorage.read(key: emailKey),
      'phoneNumber': await _signUpStorage.read(key: phoneNumberKey),
      'birthDate': await _signUpStorage.read(key: birthDateKey),
      'password': await _signUpStorage.read(key: passwordKey),
    };
    return rawCredential;
  }

  static Future<void> deleteToken() async {
    await _signUpStorage.delete(key: tokenKey);
  }

  static Future<void> deleteCredentials() async {
    await _signUpStorage.delete(key: firstNameKey);
    await _signUpStorage.delete(key: usernameKey);
    await _signUpStorage.delete(key: emailKey);
    await _signUpStorage.delete(key: phoneNumberKey);
    await _signUpStorage.delete(key: birthDateKey);
    await _signUpStorage.delete(key: passwordKey);
  }
}
