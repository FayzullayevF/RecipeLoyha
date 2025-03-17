import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeItemDescription extends StatelessWidget {
  const RecipeItemDescription({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      recipeModel.description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColors.mainBackgroundColor,
        fontFamily: "League Spartan",
        fontSize: 12,
        fontWeight: FontWeight.w300,
        height: 1,
      ),
    );
  }
}
