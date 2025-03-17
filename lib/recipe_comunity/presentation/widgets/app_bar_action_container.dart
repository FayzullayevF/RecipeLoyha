import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/utils.dart';

class AppBarActionContainer extends StatelessWidget {
  const AppBarActionContainer({
    super.key,
    required this.svg,
    required this.callback,
    this.color = AppColors.actionContainerColor,
    this.svgColor = AppColors.pinkSubColor,
  });

  final String svg;
  final Color color, svgColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          svg,
          width: 12,
          height: 17,
          colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),

        ),
      ),
    );
  }
}