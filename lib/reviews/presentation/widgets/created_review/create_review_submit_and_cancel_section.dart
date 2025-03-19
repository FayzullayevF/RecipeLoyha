import 'package:chef_staff/core/presentations/recipe_text_button_container.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateReviewSubmitAndCancelSection extends StatelessWidget {
  const CreateReviewSubmitAndCancelSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        RecipeTextButtonContainer(
          text: "Cancel",
          textColor: AppColors.pinkSubColor,
          containerColor: AppColors.actionContainerColor,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.pop(),
        ),
        RecipeTextButtonContainer(
          text: "Submit",
          textColor: AppColors.pinkSubColor,
          containerColor: AppColors.nameColor,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.read<CreateReviewBloc>().add(CreateReviewSubmitted()),
        )
      ],
    );
  }
}
