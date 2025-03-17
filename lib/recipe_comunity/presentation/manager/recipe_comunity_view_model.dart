import 'package:chef_staff/data/models/recipe_comunity_model.dart';
import 'package:chef_staff/data/repository/recipe_comunity_repository.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/repository/recipe_repository.dart';

class RecipeCommunityViewModel extends ChangeNotifier {
  RecipeCommunityViewModel({required RecipeCommunityRepository recipeRepo})
      : _recipeRepo = recipeRepo;
  final RecipeCommunityRepository _recipeRepo;
  bool loading = true;
  int selectedIndex = 0;
  List<String> nextPages = ['Top Recipes', 'Newest', 'Oldest'];

  List<RecipeCommunityModel> topRecipes = [];
  List<RecipeCommunityModel> newestRecipes = [];
  List<RecipeCommunityModel> oldestRecipes = [];

  Future load() async {
    loading = true;
    notifyListeners();
    topRecipes = await _recipeRepo.fetchCommunityRecipes(order: 'rating');
    newestRecipes = await _recipeRepo.fetchCommunityRecipes(order: 'date');
    oldestRecipes = await _recipeRepo.fetchCommunityRecipes(order: 'date', descending: false);
    loading = false;
    notifyListeners();
  }

  num getFormattedRating(double rating) {
    return rating == rating.toInt() ? rating.toInt() : rating;
  }

  void toggleSelection(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<RecipeCommunityModel> get selectedRecipes {
    if (selectedIndex == 0) return topRecipes;
    if (selectedIndex == 1) return newestRecipes;
    if (selectedIndex == 2) return oldestRecipes;
    return [];
  }

  String getFormattedDate(int index) {
    int nowYear = DateTime.now().year;
    int nowMonth = DateTime.now().month;
    int apiYear = int.parse(selectedRecipes[index].created.substring(0, 4));
    int apiMonth = int.parse(selectedRecipes[index].created.substring(5, 7));

    if (nowYear - apiYear > 0) {
      return '${nowYear - apiYear} years ago';
    } else if (nowMonth - apiMonth > 0) {
      return '${nowMonth - apiMonth} month ago';
    }
    return "a few days ago";
  }
}