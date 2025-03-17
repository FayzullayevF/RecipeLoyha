import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailFollowandFollowing extends StatelessWidget {
  const RecipeDetailFollowandFollowing({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            vm.ButtonPressed();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: vm.isFollowing
                  ? AppColors.nameColor
                  : AppColors.actionContainerColor),
          child: Text(
            vm.isFollowing ? "Follow" : "Following",
            style: TextStyle(
              color:
                  vm.isFollowing ? AppColors.whiteBeige : AppColors.nameColor,
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: AppColors.nameColor,
            ))
      ],
    );
  }
}
