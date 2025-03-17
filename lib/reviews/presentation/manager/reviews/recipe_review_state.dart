import 'package:chef_staff/data/models/recipe_review_comments_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/recipe_review_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;
  final List<RecipeReviewCommentsModel>? recipeComments;

  const ReviewsState(
      {required this.recipeModel,
      required this.status,
      required this.recipeComments});

  ReviewsState copyWith({
    ReviewsRecipeModel? recipeModel,
    ReviewsStatus? status,
    List<RecipeReviewCommentsModel>? recipeComments,
  }) {
    return ReviewsState(
        recipeModel: recipeModel ?? this.recipeModel,
        status: status ?? this.status,
        recipeComments: recipeComments ?? this.recipeComments);
  }

  @override
  List<Object?> get props => [recipeModel, status, recipeComments];
}
