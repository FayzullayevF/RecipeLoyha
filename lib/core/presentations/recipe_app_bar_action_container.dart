import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeAppBarActionContainers extends StatelessWidget {
  const RecipeAppBarActionContainers({
    super.key,
    required this.containerColor,
    required this.svgColor,
    required this.svg,

  });

  final Color containerColor;
  final Color svgColor;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(child: SvgPicture.asset(svg)),
    );
  }
}
