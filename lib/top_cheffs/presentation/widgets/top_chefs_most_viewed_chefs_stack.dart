import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chef_state.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chefs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopChefsMostViewedChefsStack extends StatelessWidget {
  const TopChefsMostViewedChefsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        bottom: -58,
        left: 10,
        child: Container(
          width: 160.w,
          height: 76.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "name",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                // SizedBox(height: 3.h),
                Text(
                  "username",
                  style: TextStyle(
                      color: AppColors.nameColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "6666",
                      style: TextStyle(
                          color: AppColors.nameColor,
                          fontSize: 12,
                          height: 1),
                    ),
                    SizedBox(width: 3.w),
                    SvgPicture.asset("assets/icons/star.svg"),
                    SizedBox(
                      width: 40.w,
                    ),
                    Container(
                      height: 12.h,
                      width: 38.w,
                      decoration: BoxDecoration(
                        color: AppColors.nameColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Following",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 6),
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Container(
                      height: 14.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        color: AppColors.nameColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/share.svg",
                          width: 7,
                          height: 8,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0.6,
                color: Colors.black.withValues(alpha: 0.1),
                offset: Offset(5, 1)),
          ],
        ),
        child: Image(
          image: AssetImage("assets/images/review.png"),
          width: 170,
          height: 153,
        ),
      )
    ],
          );
  }
}
