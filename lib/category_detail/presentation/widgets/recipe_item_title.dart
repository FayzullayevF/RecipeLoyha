import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeItemTitle extends StatelessWidget {
  const RecipeItemTitle({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipeModel.title,
      maxLines: 1,
      style: TextStyle(
        color: AppColors.mainBackgroundColor,
        fontSize: 13,
      ),
    );
  }
}
