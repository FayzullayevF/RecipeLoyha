import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_review_state.dart';

part 'recipe_review_event.dart';

class RecipeReviewBloc extends Bloc<ReviewsEvent, ReviewsState> {
  RecipeReviewBloc({
    required RecipeRepository repo,
    required int recipeId,
  })  : _repo = repo,
        super(
          ReviewsState(
            status: ReviewsStatus.loading,
            recipeModel: null,
            recipeComments: null
          ),
        ) {
    on<ReviewsLoading>(_onLoad);
    add(ReviewsLoading(recipeId: recipeId));
  }

  final RecipeRepository _repo;

  Future<void> _onLoad(ReviewsLoading event, Emitter<ReviewsState> emit) async {
    emit(state.copyWith(status: ReviewsStatus.loading));
    emit(ReviewsState(recipeModel: null, recipeComments: null,status: ReviewsStatus.loading));
    final recipe = await _repo.fetchRecipeForReviews(event.recipeId);
    final recipeComment = await _repo.fetchRecipeReviewComments(event.recipeId);
    emit(state.copyWith(recipeComments: recipeComment, recipeModel: recipe, status: ReviewsStatus.idle));
  }
}
