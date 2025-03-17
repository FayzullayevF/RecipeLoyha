import 'package:chef_staff/recipe_comunity/presentation/widgets/recipe_community_detail.dart';
import 'package:chef_staff/recipe_comunity/presentation/widgets/recipe_community_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/utils.dart';
import '../manager/recipe_comunity_view_model.dart';

class CommunityDetailItem extends StatelessWidget {
  const CommunityDetailItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeCommunityViewModel>();
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommunityRecipeProfile(
          photo: vm.selectedRecipes[index].user.profilePhoto,
          username: vm.selectedRecipes[index].user.username,
          date: vm.getFormattedDate(index),
        ),
        GestureDetector(
          onTap: () {
            context.push('${Routes.recipeDetail}/${vm.selectedRecipes[index].id}');
          },
          child: CommunityRecipeDetail(
            photo: vm.selectedRecipes[index].photo,
            title: vm.selectedRecipes[index].title,
            rating: vm.selectedRecipes[index].rating.toDouble(),
            description: vm.selectedRecipes[index].description,
            time: vm.selectedRecipes[index].timeRequired,
            reviewCount: vm.selectedRecipes[index].reviewsCount,
          ),
        ),
        Divider(color: AppColors.pinkSubColor),
        SizedBox(height: 4),
      ],
    );
  }
}