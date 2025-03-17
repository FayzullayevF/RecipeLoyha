import 'dart:io';
import 'package:chef_staff/authentication/presentation/manager/complite_profile_view_model.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfilePhotoPicker extends StatefulWidget {
  const ProfilePhotoPicker({super.key});

  @override
  State<ProfilePhotoPicker> createState() => _ProfilePhotoPickerState();
}

class _ProfilePhotoPickerState extends State<ProfilePhotoPicker> {
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    var profilePhoto =
        context.select((CompliteProfileViewModel vm) => vm.profilePhoto);
    return SizedBox(
      width: 100.81.w,
      height: 100.81.h,
      child: Stack(children: [
        Container(
            padding: EdgeInsets.only(left: 32, top: 23, right: 31, bottom: 22),
            width: 100.81.w,
            height: 100.81.h,
            decoration: BoxDecoration(
                image: profilePhoto != null
                    ? DecorationImage(
                        image: FileImage(profilePhoto), fit: BoxFit.cover)
                    : null,
                shape: BoxShape.circle,
                color: AppColors.actionContainerColor),
            child: profilePhoto != null
                ? null
                : SvgPicture.asset("assets/icons/profileBig.svg")),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () async {
              await context.read<CompliteProfileViewModel>().pickProfilePhoto();
              // setState(() {});
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 7, 5, 3),
              height: 29.h,
              width: 29.w,
              decoration: BoxDecoration(
                color: AppColors.nameColor,
                borderRadius: BorderRadius.circular(8.8),
              ),
              child: SvgPicture.asset("assets/icons/edit.svg"),
            ),
          ),
        )
      ]),
    );
  }
}
