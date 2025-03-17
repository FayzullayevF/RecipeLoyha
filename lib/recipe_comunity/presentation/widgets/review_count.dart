import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/utils.dart';

class ReviewsCount extends StatelessWidget {
  const ReviewsCount({
    super.key,
    required this.reviewsCount,
    this.color = AppColors.pinkSubColor,
    this.svgFirst = false,
  });

  final int reviewsCount;
  final Color color;
  final bool svgFirst;

  @override
  Widget build(BuildContext context) {
    final reviews = Text(
      '${reviewsCount.toString()}',
      style: TextStyle(
        color: color,
        fontSize: 12,
      ),
    );
    final svg = SvgPicture.asset('assets/icons/reviews.svg',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
    return Row(
      spacing: 5,
      children: [
        !svgFirst ? reviews : svg,
        !svgFirst ? svg : reviews,
      ],
    );
  }
}
