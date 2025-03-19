import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateReviewReviewSection extends StatelessWidget {
  const CreateReviewReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      minLines: 4,
      controller: context.read<CreateReviewBloc>().reviewController,
      style: TextStyle(
        color: AppColors.mainBackgroundColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "Leave us Review",
        hintStyle: TextStyle(
          color: AppColors.mainBackgroundColor.withValues(alpha: 0.45),
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        filled: true,
        fillColor: AppColors.actionContainerColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
