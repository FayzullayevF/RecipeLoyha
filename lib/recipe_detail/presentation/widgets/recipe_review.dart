import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecipeReview extends StatelessWidget {
  const RecipeReview({
    super.key,
    required this.review
  });

  final int review;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/review.svg",
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          review.toString(),
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
