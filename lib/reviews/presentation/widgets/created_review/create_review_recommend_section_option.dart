import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateReviewRecommendSectionOption extends StatelessWidget {
  const CreateReviewRecommendSectionOption({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          Radio(
            value: value,
            fillColor: WidgetStateColor.fromMap({
              WidgetState.any: AppColors.nameColor,
            }),
            groupValue: state.doesRecommend,
            onChanged: (value) => context.read<CreateReviewBloc>().add(
                  CreateReviewRecommendOrNot(value: value!),
                ),
          )
        ],
      ),
    );
  }
}
