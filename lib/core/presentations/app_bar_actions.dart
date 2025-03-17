
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.svg,
    required this.color,
    required this.svg_Color,
  });

  final String svg;
  final Color color, svg_Color;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 28.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: SvgPicture.asset(svg, colorFilter: ColorFilter.mode(svg_Color, BlendMode.srcIn),width: 14.w, height: 19.h,),
      ),
    );
  }
}
