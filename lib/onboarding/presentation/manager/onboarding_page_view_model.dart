import 'package:chef_staff/data/models/onboarding_page_model.dart';
import 'package:chef_staff/data/repository/onboarding_page_repository.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel({required OnboardingRepository repo}) : _repo = repo {
    load();
  }

  final OnboardingRepository _repo;

  List<OnboardingPageModel> pages = [];
  final controller = PageController();

  Future<void> load() async {
    pages = await _repo.fetchOnboardingPages();
    notifyListeners();
  }
}
