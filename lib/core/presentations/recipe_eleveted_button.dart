import 'package:flutter/material.dart';

import '../utils/utils.dart';


class RecipeElevatedButton extends StatelessWidget {
  const RecipeElevatedButton({
    super.key,
    required this.text,
    required this.callback,
    this.foregroundColor = AppColors.pinkSubColor,
    this.backgroundColor = AppColors.actionContainerColor,
    this.textColor = AppColors.actionContainerColor,
    this.size = const Size(207, 45),
    this.fontSize = 20,
    this.elevation = 0,
  });

  final String text;
  final VoidCallback callback;
  final Color foregroundColor, backgroundColor, textColor;
  final Size size;
  final double fontSize;
  final double elevation;


  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          fixedSize: size,
          elevation: elevation,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: textColor
          ),
        ),
      ),
    );
  }
}