import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeReviewCommentsItem extends StatelessWidget {
  const RecipeReviewCommentsItem({
    super.key,
    required this.profileImage,
    required this.comment,
    required this.time,
    required this.rating,
    required this.username,
  });

  final String profileImage;
  final String comment, username;
  final DateTime time;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 36, right: 36, bottom: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Comments",
            style: TextStyle(
              color: AppColors.nameColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profileImage),
                radius: 20,
              ),
              SizedBox(width: 10),
              Text(
                "@$username",
                style: TextStyle(
                  color: AppColors.nameColor,
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(width: 50),
              Text(
                time.toString(),
                style: TextStyle(
                  color: AppColors.nameColor,
                  fontSize: 12,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Text(
            textAlign: TextAlign.start,
            comment,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontFamily: "Poppins",
                color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            spacing: 3,
            children: List.generate(
              5,
              (index) {
                if (index + 1 <= rating.toInt()) {
                  return SvgPicture.asset(
                    'assets/icons/star-redPink-filled.svg',
                    // colorFilter: ColorFilter.mode(
                    //   Colors.white,
                    //   BlendMode.srcIn,
                    // ),
                  );
                } else {
                  return SvgPicture.asset(
                      'assets/icons/star-redPink-empty.svg');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
