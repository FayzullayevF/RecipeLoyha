part of 'recipe_review_bloc.dart';

sealed class ReviewsEvent {}

final class ReviewsLoading extends ReviewsEvent {
  final int recipeId;

  ReviewsLoading({required this.recipeId});
}
