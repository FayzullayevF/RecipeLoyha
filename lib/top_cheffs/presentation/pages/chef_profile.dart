import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar_action_container.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/pages/chef_profile_container_inside_text.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/chefs_profile_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: SvgPicture.asset("assets/icons/back-arrow.svg"),
        ),
        title: Text(
          "username",
          style: TextStyle(
            color: AppColors.nameColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 36),
            child: Row(
              children: [
                RecipeAppBarActionContainers(
                    containerColor: AppColors.actionContainerColor,
                    svgColor: AppColors.pinkSubColor,
                    svg: "assets/icons/share.svg"),
                SizedBox(width: 5.w),
                RecipeAppBarActionContainers(
                    containerColor: AppColors.actionContainerColor,
                    svgColor: AppColors.pinkSubColor,
                    svg: "assets/icons/three-dots.svg"),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage("assets/images/neil.png"),
                    width: 102.w,
                    height: 97,
                  ),
                ),
                SizedBox(width: 13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Passionate chef in creative and\ncontemporary cuisine.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    RecipeElevatedButton(
                      text: "Following",
                      textColor: AppColors.pinkSubColor,
                      callback: () {},
                      backgroundColor: AppColors.actionContainerColor,
                      fontSize: 10,
                      size: Size(110.w, 19.h),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              width: 356,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.mainBackgroundColor,
                  border: Border.all(
                    width: 1,
                    color: AppColors.actionContainerColor,
                  ),
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChefProfileContainerInsideText(text: "recipes", count: "15",),
                  Container(height: 26,width: 1,decoration: BoxDecoration(color: AppColors.actionContainerColor),),
                  ChefProfileContainerInsideText(text: "Following", count: "10",),
                  Container(height: 26,width: 1,decoration: BoxDecoration(color: AppColors.actionContainerColor),),
                  ChefProfileContainerInsideText(text: "Followers", count: "255.770",),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
            Center(child: Text("Recipe",style: TextStyle(color: Colors.white,fontSize: 12),)),
            SizedBox(height: 10.h,),
            Container(height: 2,width: double.infinity,decoration: BoxDecoration(color: AppColors.nameColor),),
            SizedBox(height: 15.h,),
            ChefsProfileStack(text: "Vegan Recipe",image: "assets/images/vegan-recipe.png",),
            SizedBox(height: 20.h,),
            ChefsProfileStack(text: "Asian Heritage",image: "assets/images/vegan-recipe.png",),
            SizedBox(height: 20.h,),
            ChefsProfileStack(text: "Guilty Pleasures",image: "assets/images/vegan-recipe.png",),
          ],
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
