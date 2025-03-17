import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class CommunityRecipeProfile extends StatelessWidget {
  const CommunityRecipeProfile({
    super.key,
    required this.photo,
    required this.username,
    required this.date,
  });
  final String photo;
  final String username;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: [
        CircleAvatar(
          radius: 23,
          backgroundColor: AppColors.nameColor,
          backgroundImage: NetworkImage(
            photo,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '@${username}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${date}',
              style: TextStyle(
                color: AppColors.nameColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}