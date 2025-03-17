import 'package:chef_staff/recipe_detail/presentation/widgets/recipe_detail_main_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailText extends StatelessWidget {
  const RecipeDetailText({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecipeDetailMainText(text: "Details"),
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          "assets/icons/clock.svg",
          colorFilter: ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "${vm.recipe.timeRequired.toString()} min",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
