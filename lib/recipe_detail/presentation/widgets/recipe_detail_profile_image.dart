import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailProfileImage extends StatelessWidget {
  const RecipeDetailProfileImage({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Image.network(
        vm.recipe.user.profilePhoto,
        fit: BoxFit.cover,
        height: 63.h,
        width: 62.w,
      ),
    );
  }
}
