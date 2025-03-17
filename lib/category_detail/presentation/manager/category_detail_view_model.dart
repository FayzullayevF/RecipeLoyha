import 'package:chef_staff/data/models/categories_model.dart';
import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:chef_staff/data/models/recipe_model.dart';
import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailEvent {}

class CategoryDetailLoading extends CategoryDetailEvent {}

enum CategoryDetailStatus { idle, loading, error }

class CategoryDetailState extends Equatable {
  const CategoryDetailState({
    required this.categories,
    required this.recipes,
    required this.status,
    required this.selected,
  });

  final List<CategoriesModel> categories;
  final List<RecipeModel> recipes;
  final CategoryDetailStatus status;
  final CategoriesModel? selected;

@override
  List<Object?> get props => [categories, recipes, status, selected];
}

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  CategoryDetailBloc({
    required CategoriesRepository catRepo,
    required RecipeRepository recipeRepo,
    required int selectedId,
  })
      : _catRepo = catRepo,
        _recipeRepo = recipeRepo,
        super(
        CategoryDetailState(
          categories: [],
          recipes: [],
          status: CategoryDetailStatus.loading,
          selected: null,
        ),
      ) {
    on<CategoryDetailLoading>((event, emit) async {
      emit(
        CategoryDetailState(
          categories: [],
          recipes: [],
          status: CategoryDetailStatus.loading,
          selected: null,
        ),
      );
      final categories = await _catRepo.fetchCategories();
      emit(
        CategoryDetailState(
          categories: categories,
          recipes: await _recipeRepo.fetchRecipeByCategory(selectedId),
          status: CategoryDetailStatus.idle,
          selected: categories.singleWhere((category) =>
          category.id == selectedId),
        ),
      );
    });
  }

  final CategoriesRepository _catRepo;
  final RecipeRepository _recipeRepo;

}
