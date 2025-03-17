import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipePasswordFormField extends StatelessWidget {
  const RecipePasswordFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.validator
  });

  final TextEditingController controller;
  final String title;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
        ),
        SizedBox(
          height: 61 * AppSizes.hRatio,
          width: 357 * AppSizes.wRatio,
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              color: AppColors.mainBackgroundColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: AppSizes.padding36, right: 20),
              suffix:  SvgPicture.asset(
                    'assets/icons/hidePassword.svg',
                    height: 24,
                    width: 25,
                    fit: BoxFit.cover,
                  ),
              hintText:  "●●●●●●●●",
              hintStyle: TextStyle(
                color: AppColors.mainBackgroundColor.withValues(alpha: 0.45),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                height: 1,
              ),
              filled: true,
              fillColor: AppColors.actionContainerColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
