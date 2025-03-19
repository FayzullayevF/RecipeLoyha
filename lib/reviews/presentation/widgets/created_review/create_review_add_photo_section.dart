import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateReviewAddPhotoSection extends StatelessWidget {
  const CreateReviewAddPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox.fromSize(
              size: Size(21.w, 21.h),
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.actionContainerColor,
                  padding: EdgeInsets.zero,
                ),
                color: AppColors.nameColor,
                onPressed: () async => context
                    .read<CreateReviewBloc>()
                    .add(CreateReviewPickImage()),
                iconSize: 18,
                icon: Icon(Icons.add),
              ),
            ),
            Text("Add Photo")
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) {
          if (state.pickedImage != null) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Image.file(
                state.pickedImage!,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        })
      ],
    );
  }
}
