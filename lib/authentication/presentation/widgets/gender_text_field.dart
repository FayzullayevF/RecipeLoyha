import 'package:chef_staff/authentication/presentation/manager/complite_profile_view_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GenderTextField extends StatelessWidget {
  const GenderTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CompliteProfileViewModel>();
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        GestureDetector(
          onTap: () async{
            final result = await showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                width: double.infinity.w,
                height: 150.h,
                decoration: BoxDecoration(
                  color: AppColors.actionContainerColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("Male");
                      },
                      child: Text("Male",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.mainBackgroundColor),),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("Female");
                      },
                      child: Text("Female",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.mainBackgroundColor),),
                    )
                  ],
                ),
              ),
            );
            vm.gender = result;
          },
          child: Container(
            width: double.infinity.w,
            height: 48.h,
            padding: EdgeInsets.only(left: 24.w),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.actionContainerColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              vm.gender == null ? "Male/Female": vm.gender!,
              style: TextStyle(
                color: AppColors.mainBackgroundColor.withValues(alpha: vm.gender == null ? 0.5 : 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
