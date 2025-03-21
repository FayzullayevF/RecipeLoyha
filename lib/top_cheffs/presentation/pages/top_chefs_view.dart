import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar_action_container.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chef_state.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chefs_bloc.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/top_chef_texts.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/top_chefs_most_viewd_chefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefsBloc, ChefsState>(
      builder: (context, state) => Scaffold(
        extendBody: true,
        appBar: RecipeAppBar(title: "Top Chef", actions: [
          Row(
            spacing: 5,
            children: [
              RecipeAppBarActionContainers(
                  containerColor: AppColors.actionContainerColor,
                  svgColor: AppColors.nameColor,
                  svg: "assets/icons/notification.svg"),
              RecipeAppBarActionContainers(
                  containerColor: AppColors.actionContainerColor,
                  svgColor: AppColors.nameColor,
                  svg: "assets/icons/search.svg"),
            ],
          )
        ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 285.h,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 9.h),
              decoration: BoxDecoration(
                color: AppColors.nameColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeMostViewedText(
                      text: "Most Viewed Chefs", textColor: Colors.white),
                  SizedBox(
                    height: 10,
                  ),
                  TopChefsMostViewedChefs(),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 36),
                children: [
                  RecipeMostViewedText(text: "Most Liked Chefs", textColor: AppColors.nameColor),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    TopChefsMostViewedChefs(),
                  ],),
                  SizedBox(height: 75.h,),
                  RecipeMostViewedText(text: "New Chefs", textColor: AppColors.nameColor),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                    TopChefsMostViewedChefs(),
                  ],),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
