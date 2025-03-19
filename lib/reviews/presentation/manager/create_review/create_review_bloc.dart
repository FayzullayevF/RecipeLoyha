import 'dart:io';

import 'package:chef_staff/data/models/create_review_model.dart';
import 'package:chef_staff/data/repository/create_review_repository.dart';
import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/data/repository/review_repository.dart';
import 'package:chef_staff/reviews/presentation/manager/create_review/create_review_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'create_review_event.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final RecipeRepository _recipeRepo;
  final ReviewRepository _reviewRepo;
  final reviewController = TextEditingController();

  CreateReviewBloc({
    required RecipeRepository recipeRepo,
    required ReviewRepository reviewRepo,
  })  : _recipeRepo = recipeRepo,
        _reviewRepo = reviewRepo,
        super(CreateReviewState.initial()) {
    on<CreateReviewRate>(_onRate);
    on<CreateReviewPickImage>(_onPickedImage);
    on<CreateReviewRecommendOrNot>(_onRecommendOrNot);
    on<CreateReviewLoading>(_onLoad);
    on<CreateReviewSubmitted>(_onReviewSubmitted);
  }

  @override
  Future<void> close() async {
    reviewController.dispose();
    return super.close();
  }

  Future _onLoad(
      CreateReviewLoading event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(
        status: CreateReviewStatus.loading, recipeId: event.recipeId));
    final recipe = await _recipeRepo.fetchRecipeForCreateReview(event.recipeId);
    emit(state.copyWith(status: CreateReviewStatus.idle, recipeModel: recipe));
  }

  Future<void> _onRate(
      CreateReviewRate event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(
        currentIndex: event.currentIndex, status: CreateReviewStatus.idle));
  }

  Future<void> _onPickedImage(
      CreateReviewEvent event, Emitter<CreateReviewState> emit) async {
    File? image;
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(state.copyWith(pickedImage: image));
    }
  }

  Future<void> _onRecommendOrNot(
      CreateReviewRecommendOrNot event, Emitter<CreateReviewState> emit) async {
    emit(state.copyWith(doesRecommend: event.value));
  }

  Future<void> _onReviewSubmitted(
      CreateReviewSubmitted event, Emitter<CreateReviewState> emit) async {
    final successful = await _reviewRepo.createReview(
        recipeId: state.recipeId!,
        comment: reviewController.text,
        rating: state.currentIndex! + 1,
        photo: state.pickedImage,
        recommend: state.doesRecommend!);
    if(successful){
      emit(state.copyWith(status: CreateReviewStatus.submitted));
    }else{
      emit(state.copyWith(status: CreateReviewStatus.error));
    }
  }
}
