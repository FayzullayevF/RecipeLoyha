
import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/presentations/app_bar_actions.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/home_page/presentations/manager/home_page_view_model.dart';
import 'package:chef_staff/home_page/presentations/widgets/app_bar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(right: 25.w),
      centerTitle: false,
      title: Padding(
        padding:  EdgeInsets.only(left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              "Salam! Fatxullo",
              style: TextStyle(
                fontSize: 25,
                color: AppColors.nameColor,
              ),
            ),
            Text("What are youb  cocking today", style: TextStyle(color: Colors.white, fontSize: 13,),)
          ],
        ),
      ),
      actions: [
        Row(
          spacing: 5,
          children: [
            AppBarActions(svg: "assets/icons/notification.svg", color: AppColors.actionContainerColor, svg_Color: AppColors.pinkSubColor),
            AppBarActions(svg: "assets/icons/search.svg", color: AppColors.actionContainerColor, svg_Color: AppColors.pinkSubColor),
          ],
        ),
      ],
      bottom: AppBarBottom(vm: HomePageViewModel(categoryRepo: CategoriesRepository(client: ApiClient())),),
    );
  }
  
  @override

  Size get preferredSize => Size(double.infinity, 100);
}
