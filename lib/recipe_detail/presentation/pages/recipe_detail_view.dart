import 'package:chef_staff/category_detail/presentation/widgets/category_detail_appbar.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/routing/routes.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_description.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_divider.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_main_text.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_text.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_video_and_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/presentations/app_bar_actions.dart';
import '../../../core/utils/utils.dart';
import '../manager/recipe_detail_view_model.dart';
import '../widgets/recipe_detail_profile_main.dart';

class RecipeDetailView extends StatelessWidget {
  RecipeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RecipeDetailViewModel>();
    if (vm.loading) {
      return Center(
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      );
    } else {
      return Scaffold(
        appBar: RecipeAppBar(
          title: vm.recipe.title,
          backButtonCallBack: () => context.pop(),
          actions: [
            Row(
              children: [
                AppBarActions(
                  svg: "assets/icons/heart.svg",
                  color: AppColors.actionContainerColor,
                  svg_Color: AppColors.pinkSubColor,
                ),
                SizedBox(
                  width: 5,
                ),
                AppBarActions(
                  svg: "assets/icons/share.svg",
                  color: AppColors.actionContainerColor,
                  svg_Color: AppColors.pinkSubColor,
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RecipeDetailVideoAndStats(),
                    SizedBox(height: 27.h),
                    RecipeDetailProfileMain(vm: vm),
                    SizedBox(height: 21),
                    RecipeDetailDivider(),
                    SizedBox(height: 15),
                    RecipeDetailText(vm: vm),
                    SizedBox(height: 10),
                    RecipeDetailDescription(vm: vm),
                    SizedBox(height: 31),
                    RecipeDetailMainText(text: "Ingredient"),
                    SizedBox(height: 24),
                    Column(children: vm.getIngredient(),),
                    SizedBox(height: 31,),
                    RecipeDetailMainText(text: "${vm.recipe.instructions.length} Easy Steps"),
                    Column(
                      children: vm.getInstructions(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      );
    }
  }
}
