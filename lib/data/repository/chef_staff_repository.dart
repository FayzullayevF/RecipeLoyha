import 'package:chef_staff/data/models/chef_stuff_model.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/models/top_chef_model.dart';

import '../models/recipe_model.dart';

class ChefStaffRepository {
  ChefStaffRepository({required this.client});

  final ApiClient client;
  ChefRepository? model;

  List<ChefModel> mostViewedChefs = [];
  List<ChefModel> mostLikedChefs = [];
  List<ChefModel> newChefs = [];

  Future<ChefRepository> fetchUser() async {
    if (model != null) return model!;
    var rawUser = await client.fetchUser();
    model = ChefRepository.fromJson(rawUser);
    return model!;
  }

  List<RecipeModel> recipeModel = [];

  Future<List<RecipeModel>> fetchRecipe() async {
    if (recipeModel.isNotEmpty) return recipeModel;
    final rawRecipe = await client.fetchRecipes();
    recipeModel = rawRecipe.map((json) => RecipeModel.fromJson(json)).toList();
    return recipeModel;
  }

  Future<List<ChefModel>> fetchMostViewedChefs() async {
    var rawMostViewedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Date", "Limit": 2, "Descending": false},
    );
    mostViewedChefs = rawMostViewedChefs.map((chef) => ChefModel.fromJson(chef)).toList();
    return mostViewedChefs;
  }

  Future<List<ChefModel>> fetchMostLikedChefs() async {
    var rawMostLikedChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Limit": 2},
    );
    mostLikedChefs = rawMostLikedChefs.map((chef) => ChefModel.fromJson(chef)).toList();
    return mostLikedChefs;
  }

  Future<List<ChefModel>> fetchNewChefs() async {
    var rawNewChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Order": "Date", "Limit": 2},
    );
    newChefs = rawNewChefs.map((chef) => ChefModel.fromJson(chef)).toList();
    return newChefs;
  }
}
