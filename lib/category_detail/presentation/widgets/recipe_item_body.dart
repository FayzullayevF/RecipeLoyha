import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_description.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_title.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_rating.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_time.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItemBody extends StatelessWidget {
  const RecipeItemBody({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: 158.5.w,
      height: 79.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border.all(color: AppColors.pinkSubColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RecipeItemTitle(recipeModel: recipeModel),
          RecipeItemDescription(recipeModel: recipeModel),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeRating(rating: recipeModel.rating),
              RecipeTime(timeRequired: recipeModel.timeRequired, color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }
}
