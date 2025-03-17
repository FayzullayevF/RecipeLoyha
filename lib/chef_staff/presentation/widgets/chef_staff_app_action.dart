import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefStaffAppAction extends StatelessWidget {
  const ChefStaffAppAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          spacing: 5,
          children: [
            Container(
              width: 28 * AppSizes.wRatio,
              height: 28 * AppSizes.hRatio,
              decoration: BoxDecoration(
                color: AppColors.actionContainerColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset('assets/icons/plus.svg'),
              ),
            ),
            Container(
              width: 28 * AppSizes.wRatio,
              height: 28 * AppSizes.hRatio,
              decoration: BoxDecoration(
                color: AppColors.actionContainerColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset('assets/icons/categories.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
