import 'dart:io';
import 'dart:math';

import 'package:chef_staff/data/models/user_model.dart';
import 'package:chef_staff/core/exceptions/auth_exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "http://192.168.10.32:8888/api/v1",
      validateStatus: (status) => true));

  Future<Map<String, dynamic>> fetchUser() async {
    var response = await dio.get("/auth/details");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw AuthException(message: "Auth error!");
    }
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    var responseRecipe = await dio.get("/recipes/list");
    if (responseRecipe.statusCode == 200) {
      List<Map<String, dynamic>> dataRecipe =
          List<Map<String, dynamic>>.from(responseRecipe.data);
      return dataRecipe;
    } else {
      throw Exception("Failed to load recipes list");
    }
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var responseOnboarding = await dio.get("/onboarding/list");
    if (responseOnboarding.statusCode == 200) {
      List<dynamic> data = responseOnboarding.data;
      return data;
    } else {
      throw Exception("Failed to load onboarding pages");
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategories() async {
    var responseCategories = await dio.get('/categories/list');
    if (responseCategories.statusCode == 200) {
      List<dynamic> data = responseCategories.data;
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception("Failed to load categories page");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {'login': login, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(message: "User not found");
    }
  }

  Future<bool> signUp(UserModels model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    return response.statusCode == 201 ? true : false;
  }

  Future<Map<String,dynamic>> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    if (response.statusCode == 200) {
      return response.data as Map<String,dynamic>;
    } else {
      throw Exception("$recipeId is not come from backend");
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap({
      "profilePhoto": await MultipartFile.fromFile(file.path,
          filename: file.path.split("/").last)
    });
    var response = await dio.patch(
      "/auth/upload",
      data: formData,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchRecipesByCategory(int categoryId) async {
    var response = await dio.get("/recipes/list?Category=$categoryId");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("CategoryDetail did not come yet");
    }
  }

  Future<dynamic> fetchTrendingRecipe() async {
    var response = await dio.get("/recipes/trending-recipe");
    if (response.statusCode == 200) {
      dynamic data = response.data;
      return data;
    } else {
      throw Exception("Trending recipe did not come");
    }
  }

  Future<List<dynamic>> fetchYourRecipes() async {
    var response = await dio.get("/recipes/list?Limit=2");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("recipeList limit did not come");
    }
  }

  Future<List<dynamic>> fetchCommunity({required String? order, bool? descending })async{
    var response = await dio.get('/recipes/community/list?Order=$order&Descending=$descending');
    if(response.statusCode == 200){
      List<dynamic> data = response.data;
      return data;
    }else{
      throw Exception("Community did not come");
    }
  }

  Future<Map<String,dynamic>> fetchRecipeReview(int recipeId)async{
    var response = await dio.get("/recipes/reviews/detail/$recipeId");
    if (response.statusCode == 200){
      Map<String, dynamic> data = response.data;
      return data;
    }else{
      throw Exception("Review did not come");
    }
  }

  Future<List<dynamic>> fetchRecipeReviewsComment(int recipeId)async{
    var response = await dio.get('/reviews/list?recipe=$recipeId');
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("Recipe Review did not come");
    }
  }
}
