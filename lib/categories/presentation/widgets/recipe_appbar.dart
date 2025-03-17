import 'package:chef_staff/categories/presentation/widgets/recipe_icon_button_container.dart';
import 'package:chef_staff/core/presentations/recipe_icon_button.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/styles.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppbar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size(double.infinity, 61);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
      child: AppBar(
        toolbarHeight: 61,
        leadingWidth: 35,
        leading: RecipeIconButton(
          callback: context.pop,
          image: "assets/icons/back-arrow.svg",
          width: 30,
          height: 14,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconColor: AppColors.pinkSubColor,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconColor: AppColors.pinkSubColor,
            callback: () {},
          )
        ],
      ),
    );
  }
}
