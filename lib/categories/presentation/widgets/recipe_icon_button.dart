import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../core/presentations/recipe_svg_image.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    this.alignment = Alignment.center,
    this.color = AppColors.nameColor,
    required this.image,
    required this.width,
    required this.height,
    required this.callback,
  });

  final String image;
  final Alignment alignment;
  final Color color;
  final double width, height;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: callback,
      icon: RecipeSvgImage(
        image: image,
        width: width,
        height: height,
        color: color,
        alignment: alignment,
      ),
    );
  }
}
