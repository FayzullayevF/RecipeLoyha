import 'dart:io';

import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/models/create_review_model.dart';

class CreateReviewRepository {
  CreateReviewRepository({required this.client});

  final ApiClient client;

  Future<bool> createReview({
    required int recipeId,
    required String comment,
    required int rating,
    required bool recommend,
    File? photo,
  }) async {
    final reviewModel = CreateReviewModel(
      recipeId: recipeId,
      rating: rating,
      comment: comment,
      recommend: recommend,
      photo: photo,
    );
    final result = await client.createReview(reviewModel);
    return result;
  }
}
