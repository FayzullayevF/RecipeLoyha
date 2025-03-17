import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesEvent{}

class CategoriesLoading extends CategoriesEvent{}

class CategoriesBloc extends Bloc<CategoriesEvent,CategoriesState> {
  CategoriesBloc({required CategoriesRepository repo})
      : _repo = repo,
        super(
          CategoriesState(
              categories: [],
              mainCategory: null,
              status: CategoriesStatus.loading),
        ) {
    on<CategoriesLoading>(load);
    add(CategoriesLoading());
  }

  final CategoriesRepository _repo;

  Future<void> load(CategoriesLoading event, Emitter<CategoriesState> emit) async {
    final allCategories = await _repo.fetchCategories();
    emit(
      CategoriesState(
        categories: allCategories.where((category) => !category.main).toList(),
        mainCategory: allCategories.firstWhere((category) => category.main),
        status: CategoriesStatus.idle,
      ),
    );
  }
}
