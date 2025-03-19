import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../data/models/recipe_create_review_model.dart';

enum CreateReviewStatus { idle, loading, error, submitted }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final bool? doesRecommend;
  final File? pickedImage;

  final RecipeCreateReviewModel? recipeModel;

  const CreateReviewState(
      {required this.currentIndex,
      required this.recipeId,
      required this.status,
      required this.pickedImage,
      required this.doesRecommend,
      required this.recipeModel});

  factory CreateReviewState.initial() {
    return CreateReviewState(
        currentIndex: null,
        recipeId: null,
        status: CreateReviewStatus.loading,
        pickedImage: null,
        doesRecommend: null,
        recipeModel: null);
  }

  CreateReviewState copyWith(
      {int? recipeId,
      int? currentIndex,
      CreateReviewStatus? status,
      File? pickedImage,
      bool? doesRecommend,
      RecipeCreateReviewModel? recipeModel}) {
    return CreateReviewState(
        currentIndex: currentIndex ?? this.currentIndex,
        recipeId: recipeId ?? this.recipeId,
        status: status ?? this.status,
        pickedImage: pickedImage ?? this.pickedImage,
        doesRecommend: doesRecommend ?? this.doesRecommend,
        recipeModel: recipeModel ?? this.recipeModel);
  }

  @override
  List<Object?> get props =>
      [recipeId, currentIndex, pickedImage, doesRecommend, recipeModel, status];
}
