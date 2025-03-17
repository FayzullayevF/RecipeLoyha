import 'package:chef_staff/categories/presentation/widgets/recipe_icon_button_container.dart';
import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:chef_staff/reviews/presentation/widgets/recipe_submit_and_cancel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/utils.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 36),
          child: SvgPicture.asset("assets/icons/back-arrow.svg"),
        ),
        title: Text(
          "Leave A Review",
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 120, horizontal: 36),
        children: [
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => context
                          .read<CreateReviewBloc>()
                          .add(CreateReviewRate(currentIndex: index)),
                      child: SizedBox(
                        width: 29.w,
                        height: 29.h,
                        child: SvgPicture.asset(
                          "assets/icons/star-${index <= (state.currentIndex ?? -1) ? 'filled' : 'empty'}.svg",
                          colorFilter: ColorFilter.mode(
                            AppColors.nameColor,
                            BlendMode.srcIn,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Your overall rating",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            minLines: 3,
            maxLines: 5,
            style: TextStyle(
              color: AppColors.mainBackgroundColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: "Leave us Review",
              hintStyle: TextStyle(
                color: AppColors.mainBackgroundColor.withValues(alpha: 0.45),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: AppColors.actionContainerColor,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () async => context.read<CreateReviewBloc>().add(CreateReviewPickImage()) ,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.actionContainerColor,
                ),
                iconSize: 21,
                color: AppColors.nameColor,
                icon: Icon(Icons.add),
              ),
              Text(
                "Add Photo",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          BlocBuilder<CreateReviewBloc, CreateReviewState>(builder: (context, state){
            if(state.pickedImage != null){
              return Image.file(state.pickedImage!);
            }else{
              return SizedBox.shrink();
            }
          }),
          SizedBox(height: 10.h),
          Row(
            children: [
              RecipeSubmitAndCancel(color: AppColors.actionContainerColor, textColor: AppColors.pinkSubColor, text: "Cancel", callback: (){},),
              RecipeSubmitAndCancel(color: AppColors.nameColor, textColor: AppColors.whiteBeige, text: "Submit", callback: (){},),

            ],
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
