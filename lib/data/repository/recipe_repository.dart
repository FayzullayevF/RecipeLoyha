import 'package:chef_staff/data/models/recipe_create_review_model.dart';
import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/models/recipe_review_comments_model.dart';
import 'package:chef_staff/data/models/trending_recipe/trending_recipes_model.dart';
import '../../recipe_detail/data/model/recipe_detail_model.dart';
import '../models/recipe_review_model.dart';
import '../models/trending_recipe/trending_recipe_model.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  RecipeDetailModel? recipe;
  Map<int, List<RecipeModel>> recipesByCategory = {};
  List<RecipeReviewCommentsModel> recipeComments = [];
  List<TrendingRecipesModel> trendingRecipes = [];
  ReviewsRecipeModel? reviewsRecipe;

  Future<List<RecipeModel>> fetchRecipeByCategory(int categoryId) async {
    if (recipesByCategory.containsKey(categoryId) &&
        recipesByCategory[categoryId] != null) {
      return recipesByCategory[categoryId]!;
    }
    var rawRecipe = await client.fetchRecipesByCategory(categoryId);
    final recipes =
        rawRecipe.map((recipe) => RecipeModel.fromJson(recipe)).toList();
    recipesByCategory[categoryId] = recipes;
    return recipes;
  }

  Future<RecipeDetailModel> fetchRecipesById(int recipeId) async {
    final rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeDetailModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<ReviewsRecipeModel> fetchRecipeForReviews(int recipeId) async {
    var rawRecipe = await client.fetchRecipeReview(recipeId);
    reviewsRecipe = ReviewsRecipeModel.fromJson(rawRecipe);
    return reviewsRecipe!;
  }

  Future<RecipeCreateReviewModel> fetchRecipeForCreateReview(
      int recipeId) async {
    var rawRecipe = await client
        .genericGetRequest<dynamic>('/recipes/create-review/$recipeId');
    return RecipeCreateReviewModel.fromJson(rawRecipe);
  }

  Future<List<TrendingRecipesModel>> fetchTrendingRecipes() async {
    var rawTrendingRecipes = await client
        .genericGetRequest<List<dynamic>>('/recipes/trending-recipes');
    trendingRecipes = rawTrendingRecipes
        .map((e) => TrendingRecipesModel.fromJson(e))
        .toList();
    return trendingRecipes;
  }
  Future<TrendingRecipeModel>fetchTrendingRecipe() async {
    var rawTrendingRecipe = await client.genericGetRequest<dynamic>('/recipes/trending-recipe');
    return TrendingRecipeModel.fromJson(rawTrendingRecipe);
  }
}
