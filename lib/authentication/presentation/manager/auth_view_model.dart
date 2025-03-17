import 'package:chef_staff/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{
  LoginViewModel({required AuthRepository repo}): _repo = repo;
  final AuthRepository _repo;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool get hasError => _errorMessage != null;
  String? get errorMessage => _errorMessage;

  Future<bool> login()async{
    try {
      await _repo.login(loginController.text, passwordController.text);
    } on Exception catch(e){
     _errorMessage = e.toString();
     notifyListeners();
     return false;
    }
    _errorMessage == null;
    notifyListeners();
    return true;
  }
}