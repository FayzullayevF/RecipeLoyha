import 'package:chef_staff/category_detail/presentation/manager/category_detail_view_model.dart';
import 'package:chef_staff/category_detail/presentation/widgets/recipe_app_bar_bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const RecipeAppBarBottom({
    super.key,
  });


  @override
  Size get preferredSize => Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
      builder:(context, state) {
        return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          children: [
            for (var category in state.categories)
              RecipeAppBarBottomItem(
                title: category.title,
                callback: () {}, //state.selected = category,
                isSelected: category.id == state.selected!.id,
              )
          ],
        ),
      );
      },
    );
  }
}
