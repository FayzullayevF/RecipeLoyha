import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum CreateReviewStatus { idle, loading, error }

class CreateReviewState extends Equatable {
  final int? recipeId;
  final int? currentIndex;
  final CreateReviewStatus? status;
  final File? pickedImage;

  const CreateReviewState(
      {required this.currentIndex,
      required this.recipeId,
      required this.status,
      required this.pickedImage});

  factory CreateReviewState.initial() {
    return CreateReviewState(
      currentIndex: null,
      recipeId: null,
      status: CreateReviewStatus.loading,
      pickedImage: null,
    );
  }

  CreateReviewState copyWith(
      {int? recipeId,
      int? currentIndex,
      CreateReviewStatus? status,
      File? pickedImage}) {
    return CreateReviewState(
        currentIndex: currentIndex ?? this.currentIndex,
        recipeId: recipeId ?? this.recipeId,
        status: status ?? this.status,
        pickedImage: pickedImage ?? this.pickedImage);
  }

  @override
  List<Object?> get props => [recipeId, currentIndex, pickedImage, status];
}
