import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/models/onboarding_page_model.dart';

class OnboardingRepository {
  OnboardingRepository({required this.client});

  final ApiClient client;
  List<OnboardingPageModel> pages = [];

  Future<List<OnboardingPageModel>> fetchOnboardingPages() async {
    if (pages.isNotEmpty) return pages;
    var rawPages = await client.fetchOnboardingPages();
    pages = rawPages.map((page) => OnboardingPageModel.fromJson(page)).toList();
    return pages;
  }
}
