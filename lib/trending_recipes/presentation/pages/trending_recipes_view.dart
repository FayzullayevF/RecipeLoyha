import 'package:chef_staff/categories/presentation/widgets/recipe_appbar.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/top_chef_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingRecipesView extends StatelessWidget {
  const TrendingRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppbar(title: "Trending Recipes"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 241.h,
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.nameColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeMostViewedText(
                    text: "Most Viewed Today", textColor: Colors.white),
                SizedBox(height: 15.h),
                Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    left: 5,
                    bottom: -40,
                    child: Container(
                      width: 348.w,
                      height: 49.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Salami and cheese pizza",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "This is a quick overview of the ingredients...",
                                style: TextStyle(
                                    fontFamily: "League Spartan",
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                spacing: 2,
                                children: [
                                  SvgPicture.asset("assets/icons/clock.svg"),
                                  Text(
                                    "30 min",
                                    style: TextStyle(
                                      color: AppColors.pinkSubColor,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "5",
                                    style: TextStyle(
                                      color: AppColors.pinkSubColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  SvgPicture.asset("assets/icons/star.svg")
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image: AssetImage("assets/images/trending.png"),
                      width: 358.w,
                      height: 143.h,
                      fit: BoxFit.cover,
                    ),
                  )
                ]),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text("See all"),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 36, right: 30),
            child: Row(
              children: [
                Image(
                  image: AssetImage("assets/images/review.png"),
                  width: 151.w,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 207.w,
                  height: 126.h,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.pinkSubColor, width: 2),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text(
                        "Chicken Curry",
                        style: TextStyle(
                            color: Colors.black, fontSize: 12, height: 1),
                      ),
                      Text(
                        "Savor the aromatic Chicken Curry—a rich blend of spices...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontFamily: "League Spartan",
                            height: 1),
                      ),
                      Text(
                        " By Chef Josh Ryan",
                        style: TextStyle(
                          color: AppColors.pinkSubColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/icons/clock.svg"),
                          Text(
                            "45 min",
                            style: TextStyle(
                              color: AppColors.pinkSubColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "Easy",
                            style: TextStyle(
                              color: AppColors.pinkSubColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SvgPicture.asset("assets/icons/diogram.svg"),
                          Text(
                            "4",
                            style: TextStyle(
                              color: AppColors.pinkSubColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SvgPicture.asset("assets/icons/star.svg"),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
