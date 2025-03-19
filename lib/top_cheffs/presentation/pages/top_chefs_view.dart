import 'package:chef_staff/core/presentations/recipe_app_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar_action_container.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/top_chef_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopChefsView extends StatelessWidget {
  const TopChefsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RecipeAppBar(title: "Top Chef", actions: [
          Row(
            spacing: 5,
            children: [
              RecipeAppBarActionContainer(
                  containerColor: AppColors.actionContainerColor,
                  svgColor: AppColors.nameColor,
                  svg: "assets/icons/notification.svg"),
              RecipeAppBarActionContainer(
                  containerColor: AppColors.actionContainerColor,
                  svgColor: AppColors.nameColor,
                  svg: "assets/icons/search.svg"),
            ],
          )
        ]),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 285.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
                  decoration: BoxDecoration(
                    color: AppColors.nameColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopChefTexts(
                          text: "Most Viewed Chef", textColor: Colors.white),
                      SizedBox(height: 6),
                      Stack(
                          children: [
                        Positioned(
                          child: Container(
                            width: 160.w,
                            height: 76.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image(
                            image: AssetImage(
                              "assets/images/review.png",
                            ),
                            width: 170.w,
                            height: 153.h,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
