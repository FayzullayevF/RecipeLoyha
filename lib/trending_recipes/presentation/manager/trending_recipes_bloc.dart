import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/trending_recipes/presentation/manager/trending_recipes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trending_recipes_event.dart';

class TrendingRecipeBloc
    extends Bloc<TrendingRecipeEvent, TrendingRecipeState> {
  TrendingRecipeBloc({required RecipeRepository trendingRecipe})
      : _trendingRecipe = trendingRecipe,
        super(TrendingRecipeState.initial()){
    on<TrendingRecipeLoading>(_onLoad);
  }
  final RecipeRepository _trendingRecipe;

  Future<void> _onLoad(
      TrendingRecipeEvent event, Emitter<TrendingRecipeState> emit) async {
    emit(state.copyWith(
      trendingRecipesStatus: TrendingRecipeStatus.loading,
      trendingRecipeStatus: TrendingRecipeStatus.loading,
    ));
    final trendingRecipe = await _trendingRecipe.fetchTrendingRecipe();
    emit(state.copyWith(trendingRecipe: trendingRecipe, trendingRecipeStatus: TrendingRecipeStatus.idle));
    final trendingRecipes = await _trendingRecipe.fetchTrendingRecipes();
    emit(state.copyWith(trendingRecipes: trendingRecipes, trendingRecipesStatus: TrendingRecipeStatus.idle));
  }
}
