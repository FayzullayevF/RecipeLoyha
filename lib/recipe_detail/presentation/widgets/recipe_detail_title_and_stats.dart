import 'package:chef_staff/category_detail/presentation/widgets/recipe_rating.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/utils.dart';
import '../manager/recipe_detail_view_model.dart';

class RecipeDetailTitleAndStats extends StatelessWidget {
  const RecipeDetailTitleAndStats({
    super.key,
    required this.title,
    required this.rating,
    required this.review,

  });
  final String title;
  final int review;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: 357.w,
        height: 85.h,
        decoration: BoxDecoration(
          color: AppColors.nameColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                spacing: 10,
                children: [
                  RecipeRating(
                    rating: rating,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    swap: true,
                  ),
                  RecipeReview(
                    review: review ,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
