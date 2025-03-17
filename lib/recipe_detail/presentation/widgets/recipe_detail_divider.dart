import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';

class RecipeDetailDivider extends StatelessWidget {
  const RecipeDetailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.pinkSubColor,
      thickness: 1,
      indent: 12,
      endIndent: 12,
    );
  }
}
