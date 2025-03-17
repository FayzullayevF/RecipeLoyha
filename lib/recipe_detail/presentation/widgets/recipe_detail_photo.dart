import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailPhoto extends StatelessWidget {
  const RecipeDetailPhoto({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        width: 357.w,
        height: 281.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
