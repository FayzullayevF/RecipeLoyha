import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/utils.dart';
import '../manager/recipe_comunity_view_model.dart';
import 'app_bar_widget.dart';

class CommunityAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommunityAppbar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeCommunityViewModel>();
    return AppBarWidget(
      leading: 'assets/icons/back-arrow.svg',
      firstAction: 'assets/icons/notification.svg',
      secondAction: 'assets/icons/search.svg',
      title: 'Community',
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
                (index) => TextButton(
              onPressed: () {
                vm.toggleSelection(index);
              },
              style: TextButton.styleFrom(
                backgroundColor: vm.selectedIndex == index
                    ? AppColors.nameColor
                    : Colors.transparent,
              ),
              child: Consumer<RecipeCommunityViewModel>(
                builder: (context, vm, child) {
                  return Text(
                    vm.nextPages[index],
                    style: TextStyle(
                      color: vm.selectedIndex == index
                          ? Colors.white
                          : AppColors.nameColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      leadingCallBack: () {},
    );
  }
}