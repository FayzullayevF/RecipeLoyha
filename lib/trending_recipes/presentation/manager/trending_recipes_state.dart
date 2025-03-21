import 'package:chef_staff/data/models/trending_recipe/trending_recipe_model.dart';
import 'package:chef_staff/data/models/trending_recipe/trending_recipes_model.dart';
import 'package:equatable/equatable.dart';

enum TrendingRecipeStatus { loading, idle, error, success }

class TrendingRecipeState extends Equatable{
  final List<TrendingRecipesModel>? trendingRecipes;
  final TrendingRecipeModel? trendingRecipe;
  final TrendingRecipeStatus trendingRecipesStatus;
  final TrendingRecipeStatus trendingRecipeStatus;

  const TrendingRecipeState(
      {required this.trendingRecipes,
      required this.trendingRecipe,
      required this.trendingRecipesStatus,
      required this.trendingRecipeStatus});

  factory TrendingRecipeState.initial() {
    return TrendingRecipeState(
      trendingRecipes: [],
      trendingRecipe: null,
      trendingRecipesStatus: TrendingRecipeStatus.idle,
      trendingRecipeStatus: TrendingRecipeStatus.idle,
    );
  }

  TrendingRecipeState copyWith({
    List<TrendingRecipesModel>? trendingRecipes,
    TrendingRecipeModel? trendingRecipe,
    TrendingRecipeStatus? trendingRecipeStatus,
    TrendingRecipeStatus? trendingRecipesStatus,
  }) {
    return TrendingRecipeState(
      trendingRecipe: trendingRecipe ?? this.trendingRecipe,
      trendingRecipes: trendingRecipes ?? this.trendingRecipes,
      trendingRecipesStatus: trendingRecipesStatus ?? this.trendingRecipesStatus,
      trendingRecipeStatus: trendingRecipeStatus ?? this.trendingRecipeStatus,
    );
  }
  @override
  List<Object?> get props => [trendingRecipe, trendingRecipes, trendingRecipeStatus,trendingRecipesStatus];
}


