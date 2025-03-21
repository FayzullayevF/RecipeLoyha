import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:chef_staff/core/presentations/recipe_app_bar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/reviews/presentation/manager/reviews/recipe_review_bloc.dart';
import 'package:chef_staff/reviews/presentation/widgets/recipe_review_comments_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../manager/reviews/recipe_review_state.dart';
import '../widgets/recipe_reviews_item.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RecipeAppBar(title: "Review", actions: null),
      extendBody: true,
      body: BlocBuilder<RecipeReviewBloc, ReviewsState>(
          builder: (context, state) {
        return switch (state.status) {
          ReviewsStatus.loading => Center(
              child: CupertinoActivityIndicator(),
            ),
          ReviewsStatus.error => Center(
              child: Text("Something went wrong..."),
            ),
          ReviewsStatus.idle => Column(
              children: [
                ReviewsRecipeItem(
                  recipe: state.recipeModel!,
                ),
                SizedBox(
                  height: 28,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.reviews.length,
                    itemBuilder: (context, index) {
                      final comments = state.reviews[index];
                      return RecipeReviewCommentsItem(
                          profileImage: comments.user.profilePhoto,
                          comment: comments.comment,
                          time: comments.created,
                          rating: comments.rating,
                          username: comments.user.username);
                    },
                  ),
                ),
              ],
            ),
        };
      }),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
