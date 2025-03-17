import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_followand_following.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_profile_image.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_profile_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailProfileMain extends StatelessWidget {
  const RecipeDetailProfileMain({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RecipeDetailProfileImage(vm: vm),
        SizedBox(
        ),
        RecipeDetailProfileInfo(vm: vm),
        SizedBox(
        ),
        RecipeDetailFollowandFollowing(vm: vm)
      ],
    );
  }
}
