import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/chef_staff/presentation/widgets/chef_staff_app_action.dart';
import 'package:chef_staff/chef_staff/presentation/widgets/chef_staff_title.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ChefStaffAppBarBody extends StatelessWidget
    implements PreferredSizeWidget {
  const ChefStaffAppBarBody({super.key, required this.vm});

  @override
  Size get preferredSize => Size(double.infinity, 225 * AppSizes.hRatio);

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.mainBackgroundColor,
        leadingWidth: 130 * AppSizes.wRatio,
        toolbarHeight: 102 * AppSizes.hRatio,
        leading: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(51),
              child: Image.network(
                vm.model!.profilePhoto,
                fit: BoxFit.cover,
              )),
        ),
        title: ChefStaffTitle(vm: vm),
        actions: [ChefStaffAppAction()],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      ShareContainer(text: "Edit Profile"),
                      ShareContainer(text: "Share Profile"),
                    ],
                  ),
                  FollowingFollowers(
                    vm: vm,
                  ),
                  TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.nameColor,
                      tabs: [
                        Text(
                          "Recipes",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Favorites",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ));
  }
}

class ShareContainer extends StatelessWidget {
  const ShareContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172 * AppSizes.wRatio,
      height: 27 * AppSizes.hRatio,
      decoration: BoxDecoration(
        color: AppColors.actionContainerColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.pinkSubColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class FollowingFollowers extends StatelessWidget {
  const FollowingFollowers({
    super.key,
    required this.vm,
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356,
      height: 49.57,
      decoration: BoxDecoration(
        color: AppColors.mainBackgroundColor,
        border: Border.all(
          color: AppColors.actionContainerColor,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColumnText(count: vm.model!.recipes, text: "recipes"),
          LineContainer(),
          ColumnText(count: vm.model!.following, text: "Following"),
          LineContainer(),
          ColumnText(count: vm.model!.followers, text: "Followers"),
        ],
      ),
    );
  }
}

class ColumnText extends StatelessWidget {
  const ColumnText({
    super.key,
    required this.count,
    required this.text,
  });

  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0.5,
      children: [
        Text(
          "$count",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class LineContainer extends StatelessWidget {
  const LineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.actionContainerColor,
      ),
    );
  }
}
