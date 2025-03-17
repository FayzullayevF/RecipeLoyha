import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ChefStaffTitle extends StatelessWidget {
  const ChefStaffTitle({
    super.key,
    required this.vm,
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          vm.model!.fullName,
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "@${vm.model!.username}",
          style: TextStyle(
            color: AppColors.nameColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          vm.model!.bio,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
