import 'package:chef_staff/data/models/recipe_review_comments_model.dart';
import 'package:chef_staff/data/models/review_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/recipe_review_model.dart';

enum ReviewsStatus { idle, loading, error }

@immutable
class ReviewsState extends Equatable {
  final ReviewsStatus status;
  final ReviewsRecipeModel? recipeModel;
  final List<ReviewModel> reviews;

  const ReviewsState(
      {required this.recipeModel,
      required this.status,
      required this.reviews});

  ReviewsState copyWith({
    ReviewsRecipeModel? recipeModel,
    ReviewsStatus? status,
    List<ReviewModel>? reviews,
  }) {
    return ReviewsState(
        recipeModel: recipeModel ?? this.recipeModel,
        status: status ?? this.status,
        reviews: reviews ?? this.reviews);
  }

  @override
  List<Object?> get props => [recipeModel, status, reviews];
}
