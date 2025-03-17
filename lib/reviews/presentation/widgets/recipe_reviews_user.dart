import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../recipe_detail/data/model/user_model.dart';

class ReviewsRecipeItemUser extends StatelessWidget {
  const ReviewsRecipeItemUser({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17.w),
          child: CachedNetworkImage(
            imageUrl: user.profilePhoto,
            width: 34.w,
            height: 34.h,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@${user.username}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              "${user.firstname} ${user.lastname}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "League Spartan",
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
