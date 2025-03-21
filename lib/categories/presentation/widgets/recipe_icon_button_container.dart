import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'recipe_icon_button.dart';

class RecipeIconButtonContainer extends StatelessWidget {
  const RecipeIconButtonContainer({
    super.key,
    this.iconColor = AppColors.nameColor,
    this.containerColor = AppColors.actionContainerColor,
    required this.image,
    required this.callback,
    this.iconWidth = 12,
    this.iconHeight = 18,
  });

  final String image;
  final Color iconColor, containerColor;

  final double iconWidth, iconHeight;

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: RecipeIconButton(
        image: image,
        width: iconWidth,
        height: iconHeight,
        color: iconColor,
        callback: callback,
      ),
    );
  }
}