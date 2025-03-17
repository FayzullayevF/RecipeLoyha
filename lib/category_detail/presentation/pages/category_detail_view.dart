import 'package:chef_staff/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_app_bar_bottom.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item.dart';
import 'package:chef_staff/category_detail/presentation/widgets/category_detail_appbar.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentations/app_bar_actions.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailBloc, CategoryDetailState>(builder: (context, state){
      return switch (state.status){
        CategoryDetailStatus.loading => Center(
          child: CupertinoActivityIndicator(
            color: AppColors.nameColor,
          ),
        ),
      CategoryDetailStatus.error => Center(child: Text("Something went wrong..."),),
      CategoryDetailStatus.idle => Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(
          title: state.selected!.title,
          bottom: RecipeAppBarBottom(),
          backButtonCallBack: () {},
          actions: [
            Row(
              children: [
                AppBarActions(
                  svg: "assets/icons/notification.svg",
                  color: AppColors.actionContainerColor,
                  svg_Color: AppColors.pinkSubColor,
                ),
                SizedBox(
                  width: 5,
                ),
                AppBarActions(
                  svg: "assets/icons/search.svg",
                  color: AppColors.actionContainerColor,
                  svg_Color: AppColors.pinkSubColor,
                ),
              ],
            )
          ],
        ),
        body: GridView.builder(
          padding: EdgeInsets.fromLTRB(16, 36, 12, 120),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 226, mainAxisSpacing: 30),
          itemCount: state.recipes.length,
          itemBuilder: (context, index) =>
              RecipeItem(recipeModel: state.recipes[index]),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      )
      };
    });
  }
}
