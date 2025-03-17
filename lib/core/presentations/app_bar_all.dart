import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarAll extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAll({
    super.key,
    required this.title,
    this.leading,
    this.action1,
    this.action2,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 64);
  final String title;
  final String? leading, action1, action2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 37.w, right: 37.w),
      child: AppBar(
        backgroundColor: AppColors.mainBackgroundColor,
        leading: leading != null ? Center(child: SvgPicture.asset(leading!)) : SizedBox(),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.nameColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            spacing: 5,
            children: [
              if(action1 != null)
               Container(
                width: 28 * AppSizes.wRatio,
                height: 28 * AppSizes.hRatio,
                decoration: BoxDecoration(
                    color: AppColors.actionContainerColor,
                    borderRadius: BorderRadius.circular(14)),
                child: Center(
                  child: SvgPicture.asset(action1!),
                ),
              ),
              if(action2 != null)
              Container(
                width: 28 * AppSizes.wRatio,
                height: 28 * AppSizes.hRatio,
                decoration: BoxDecoration(
                    color: AppColors.actionContainerColor,
                    borderRadius: BorderRadius.circular(14)),
                child: Center(
                  child: SvgPicture.asset(action2!),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
