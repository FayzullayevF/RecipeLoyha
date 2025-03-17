import 'package:flutter/material.dart';

import '../manager/recipe_detail_view_model.dart';

class RecipeDetailDescription extends StatelessWidget {
  const RecipeDetailDescription({
    super.key,
    required this.vm,
  });

  final RecipeDetailViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Text(
      vm.recipe.description,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }
}
