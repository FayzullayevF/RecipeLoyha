import 'package:chef_staff/categories/presentation/widgets/recipe_icon_button_container.dart';
import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_body.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_item_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipeModel,
  });

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169.w,
        height: 226.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          RecipeItemBody(recipeModel: recipeModel),
          RecipeItemImage(recipeModel: recipeModel),
          Positioned(
            right: 8,
            top: 7,
            child: RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              callback: () {},
              iconWidth: 16.w,
              iconHeight: 15.h,
            ),
          )
        ]),
      ),
    );
  }
}
