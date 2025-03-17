import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/utils.dart';

class RecipeCommunityRating extends StatelessWidget {
  const RecipeCommunityRating({
    super.key,
    required this.rating,
    this.textColor = AppColors.nameColor,
    this.iconColor = AppColors.nameColor,
    this.whichFirst = false,
  });

  final num rating;
  final Color textColor;
  final Color iconColor;
  final bool whichFirst;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      rating.toString(),
      style: TextStyle(
        color: textColor,
        fontSize: 12,
      ),
    );
    final svg = SvgPicture.asset(
      'assets/icons/star.svg',
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
    return Row(
      spacing: 5,
      children: [
        whichFirst ? svg : text,
        whichFirst ? text : svg,
      ],
    );
  }
}