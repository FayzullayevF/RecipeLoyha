import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class RecipeDetailMainText extends StatelessWidget {
  const RecipeDetailMainText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.nameColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}