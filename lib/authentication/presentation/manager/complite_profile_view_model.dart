import 'dart:io';

import 'package:chef_staff/data/repository/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CompliteProfileViewModel extends ChangeNotifier {
  CompliteProfileViewModel({
    required AuthRepository authRepo,
  }) : _authRepo = authRepo;

  final AuthRepository _authRepo;
  File? profilePhoto;
  final bioController = TextEditingController();

  String? _gender;
  String? get gender => _gender;

  set gender(String? value){
    _gender = value;
    notifyListeners();
  }
  Future pickProfilePhoto() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profilePhoto = File(image.path);
    }
    notifyListeners();
  }

  Future<bool> uploadProfilePhoto()async{
    if(profilePhoto != null){
    final result = await _authRepo.uploadProfilePhoto(profilePhoto!);
    return result;
    }
    return true;
  }
}
