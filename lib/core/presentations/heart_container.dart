import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartContainer extends StatelessWidget {
  const HeartContainer({
    super.key,
    this.color = AppColors.nameColor,
    this.svg_Color = Colors.white,

  });

  final Color color, svg_Color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          14,
        ),
        color: color
      ),
      child: Center(child: SvgPicture.asset("assets/icons/heart.svg")),
    );
  }
}
