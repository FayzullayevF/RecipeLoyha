import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_photo.dart';
import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_title_and_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailVideoAndStats extends StatelessWidget {
  const RecipeDetailVideoAndStats({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final recipe = context.select((RecipeDetailViewModel vm)=> vm.recipe);
    return Center(
      child: SizedBox(
        height: 357.h,
        width: 337.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            RecipeDetailTitleAndStats(title: recipe.title,review: 2458, rating: recipe.rating,),
            RecipeDetailPhoto(image: recipe.image,),
          ],
        ),
      ),
    );

  }
}
