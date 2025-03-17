import 'package:chef_staff/authentication/presentation/manager/complite_profile_view_model.dart';
import 'package:chef_staff/authentication/presentation/widgets/gender_text_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/profile_photo_picker.dart';
import 'package:chef_staff/core/presentations/app_bar_all.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({super.key});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompliteProfileViewModel(authRepo: context.read()),
      builder: (context, child) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarAll(title: "Profile")),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          children: [
            SizedBox(
              height: 54,
            ),
            Text(
              "Complate Your Profile",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            SizedBox(
              height: 44,
            ),
            Center(child: ProfilePhotoPicker()),
            SizedBox(
              height: 14,
            ),
            GenderTextField(),
            SizedBox(
              height: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bio",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 14,
                ),
                TextField(
                  minLines: 5,
                  maxLines: 5,
                  controller:
                      context.read<CompliteProfileViewModel>().bioController,
                  style: TextStyle(color: AppColors.mainBackgroundColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.actionContainerColor,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      hintText: "About yourself",
                      hintStyle: TextStyle(
                          color: AppColors.mainBackgroundColor
                              .withValues(alpha: 0.5)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(18))),
                )
              ],
            ),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.only(left: 38, right: 38),
              child: RecipeElevatedButton(
                text: "Continue",
                callback: () {
                  context.go("/categories");
                },
                size: Size(207.w, 45.h),
                fontSize: 20,
                foregroundColor: Colors.white,
                backgroundColor: AppColors.nameColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
