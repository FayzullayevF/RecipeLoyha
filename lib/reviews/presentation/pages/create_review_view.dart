import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar.dart';
import 'package:chef_staff/core/presentations/recipe_text_button_container.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_add_photo_section.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_rating_section.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_recipe_section.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_recommend_section.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_review_section.dart';
import 'package:chef_staff/reviews/presentation/widgets/created_review/create_review_submit_and_cancel_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(title: "Leave A Review", actions: null),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: BlocListener<CreateReviewBloc, CreateReviewState>(
          listener: (context, state) async {
            if (state.status == CreateReviewStatus.submitted) {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Center(
                    child: Dialog(
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 276.w,
                        height: 371.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 36.w, vertical: 36.h),
                        child: Column(
                          spacing: 20.h,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 170.w,
                              child: Text(
                                "Thanks You For Your Review!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.mainBackgroundColor,
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/icons/big-tick.svg"),
                            Text(
                              "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.mainBackgroundColor,
                                fontSize: 13,
                              ),
                            ),
                            RecipeTextButtonContainer(
                              text: "Go Back",
                              textColor: Colors.white,
                              containerColor: AppColors.nameColor,
                              containerHeight: 45.h,
                              containerWidth: 207.w,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              callback: () => context.pop(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              if (context.mounted) {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(Routes.home);
                }
              }
            }
          },
          child: ListView(
            children: [
             const CreateReviewRecipeSection(),
              SizedBox(height: 23.h,),
             const CreateReviewRatingSection(),
              SizedBox(height: 30.h,),
              const CreateReviewReviewSection(),
              SizedBox(height: 10.h,),
              const CreateReviewAddPhotoSection(),
              SizedBox(height: 23.h,),
              CreateReviewRecommendSection(),
              Spacer(),
              CreateReviewSubmitAndCancelSection(),
              SizedBox(height: 120.h,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
