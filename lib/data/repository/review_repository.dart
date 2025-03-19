import 'dart:io';

import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/models/create_review_model.dart';
import 'package:chef_staff/data/models/recipe_review_model.dart';
import 'package:chef_staff/data/models/review_model.dart';

class ReviewRepository {
  ReviewRepository({required this.client});

  final ApiClient client;

  Future<bool> createReview({
    required int recipeId,
    required String comment,
    required int rating,
    required File? photo,
    required bool recommend,
  }) async {
    final reviewModel = CreateReviewModel(
      recipeId: recipeId,
      rating: rating,
      comment: comment,
      recommend: recommend,
      photo: photo,
    );
    final result = client.createReview(reviewModel);
    return result;
  }
  Future<List<ReviewModel>> fetchReviewsByRecipe(int recipeId)async{
    var rawReview = await client.genericGetRequest<List<dynamic>>('/reviews/list?recipeId=$recipeId');
    return rawReview.map((review)=> ReviewModel.fromJson(review)).toList();
  }
}
