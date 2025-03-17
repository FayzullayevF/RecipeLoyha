import 'package:chef_staff/core/client.dart';

import '../models/categories_model.dart';

class CategoriesRepository{

  CategoriesRepository({required this.client});
  final ApiClient client;
  List<CategoriesModel> _categories = [];

  Future<List<CategoriesModel>> fetchCategories({bool refresh = false}) async{
    if(_categories.isNotEmpty && !refresh){
      return _categories;
    } 
    List<dynamic> rawCategories = await client.fetchCategories();
    _categories = rawCategories.map((e)=> CategoriesModel.fromJson(e)).toList();
    return _categories;
  }
}