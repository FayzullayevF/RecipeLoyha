import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeTextFormField extends StatelessWidget {
  const RecipeTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.title,
  });

  final String title;
  final String hintText;
  final String? Function(String? value) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 61 * AppSizes.hRatio,
          width: 357 * AppSizes.wRatio,
          child: TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyle(
              color: AppColors.mainBackgroundColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: AppSizes.padding36),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.mainBackgroundColor.withValues(alpha: 0.45),
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
