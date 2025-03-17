import 'package:chef_staff/data/models/chef_stuff_model.dart';
import 'package:chef_staff/core/client.dart';

import '../models/recipe_model.dart';

class ChefStaffRepository{
  ChefStaffRepository({
    required this.client
});
   final ApiClient client;
   ChefStuffModel? model;

   Future<ChefStuffModel> fetchUser() async{
     if(model != null) return model!;
     var rawUser = await client.fetchUser();
     model = ChefStuffModel.fromJson(rawUser);
     return model!;
   }
  List<RecipeModel> recipeModel = [];
  Future<List<RecipeModel>> fetchRecipe() async {
    if (recipeModel.isNotEmpty) return recipeModel;
    final rawRecipe = await client.fetchRecipes();
    recipeModel = rawRecipe.map((json) => RecipeModel.fromJson(json)).toList();
    return recipeModel;
  }
}
