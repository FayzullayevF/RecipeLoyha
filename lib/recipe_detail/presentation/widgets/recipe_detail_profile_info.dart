import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailProfileInfo extends StatelessWidget {
  const RecipeDetailProfileInfo({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2,
      children: [
        Text(
          '@${vm.recipe.user.username}',
          style: TextStyle(color: AppColors.nameColor, fontSize: 12, height: 1),
        ),
        Text(
          vm.recipe.user.firstname,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1),
        )
      ],
    );
  }
}
