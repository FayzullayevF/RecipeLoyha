import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeItemImage extends StatelessWidget {
  const RecipeItemImage({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 169.w,
        height: 153.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.mainBackgroundColor.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            recipeModel.photo,
            width: 169.w,
            height: 153.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
