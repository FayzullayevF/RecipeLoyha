import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/recipe_comunity/presentation/widgets/recipe_rating.dart';
import 'package:chef_staff/recipe_comunity/presentation/widgets/review_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../category_detail/presentation/widgets/recipe_rating.dart';
import '../../../category_detail/presentation/widgets/recipe_time.dart';
import '../manager/recipe_comunity_view_model.dart';
import 'app_bar_action_container.dart';

class CommunityRecipeDetail extends StatelessWidget {
  const CommunityRecipeDetail({
    super.key,
    required this.photo,
    required this.title,
    required this.rating,
    required this.description,
    required this.time,
    required this.reviewCount,
  });

  final String photo;
  final String title;
  final double rating;
  final String description;
  final int time;
  final int reviewCount;

  // final

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: photo,
                width: 356.w,
                height: 173.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 11,
                right: 11,
                child: Consumer<RecipeCommunityViewModel>(
                  builder: (context, vm, child) => AppBarActionContainer(
                    svg: 'assets/icons/heart.svg',
                    callback: () {},
                    color: AppColors.nameColor,
                    svgColor: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
          width: 356.w,
          decoration: BoxDecoration(
            color: AppColors.nameColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Column(
            children: [
              Row(
                spacing: 22,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  RecipeCommunityRating(
                    rating: rating,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    whichFirst: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textScaler: TextScaler.noScaling,
                      description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RecipeTime(
                        timeRequired: time,
                        color: Colors.white
                      ),
                      ReviewsCount(
                        reviewsCount: reviewCount,
                        color: Colors.white
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}