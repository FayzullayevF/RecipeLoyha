import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/data/repository/review_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_review_state.dart';

part 'recipe_review_event.dart';

class RecipeReviewBloc extends Bloc<ReviewsEvent, ReviewsState> {
  RecipeReviewBloc({
    required RecipeRepository recipeRepo,
    required ReviewRepository reviewRepo,
    required int recipeId,
  })  : _recipeRepo = recipeRepo,
        _reviewRepo = reviewRepo,
        super(
          ReviewsState(
            status: ReviewsStatus.loading,
            recipeModel: null,
            reviews: []
          ),
        ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }

  final RecipeRepository _recipeRepo;
  final ReviewRepository _reviewRepo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    final recipe = await _recipeRepo.fetchRecipeForReviews(event.recipeId);
    final reviews = await _reviewRepo.fetchReviewsByRecipe(event.recipeId);
    emit(state.copyWith(reviews: reviews, recipeModel: recipe, status: ReviewsStatus.idle));
  }
}
