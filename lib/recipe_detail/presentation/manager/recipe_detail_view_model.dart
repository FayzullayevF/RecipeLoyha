import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../data/model/recipe_detail_model.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  RecipeDetailViewModel({
    required RecipeRepository recipeRepo,
    required this.recipeId,
  }) : _recipeRpo = recipeRepo {
    load();
  }

  final RecipeRepository _recipeRpo;
  bool loading = true;
  final int recipeId;
  late final RecipeDetailModel recipe;

  bool _isFollowing = false;

  bool get isFollowing => _isFollowing;

  Future<void> load() async {
    loading = true;
    notifyListeners();
    recipe = await _recipeRpo.fetchRecipesById(recipeId);
    loading = false;
    notifyListeners();
  }

  void ButtonPressed() {
    _isFollowing = !_isFollowing;
    notifyListeners();
  }

  List<Widget> getIngredient() {
    return recipe.ingredients.map((ingredient) {
      return Row(
        children: [
          Text(
            "• ${ingredient.amount}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Text(
            ingredient.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );
    }).toList();
  }

  List<Widget> getInstructions() {
    return recipe.instructions.map((instructions) {
      return Column(
        children: [
          SizedBox(height: 11),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            height: 81,
            width: 356,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: instructions.order % 2 == 0
                  ? AppColors.actionContainerColor
                  : AppColors.pinkSubColor,
            ),
            child: Text(
              "${instructions.order}. ${instructions.text}",
              maxLines: 3,
              style: TextStyle(
                color: AppColors.mainBackgroundColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      );
    }).toList();
  }
}
