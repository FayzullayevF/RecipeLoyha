import 'dart:io';

import 'package:dio/dio.dart';

class CreateReviewModel {
  final int rating, recipeId;
  final String comment;
  final bool recommend;
  File? photo;

  CreateReviewModel({
    required this.recipeId,
    required this.rating,
    required this.comment,
    required this.recommend,
    this.photo,
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
      "recipeId": recipeId,
      "rating": rating,
      "comment": comment,
      "recommend": recommend,
      "image": photo != null
          ? await MultipartFile.fromFile(photo!.path,
              filename: photo!.path.split('/').last)
          : null,
    };
  }
}
