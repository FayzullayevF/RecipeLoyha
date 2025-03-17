import 'package:chef_staff/data/models/recipe_comunity_model.dart';

import '../../../core/client.dart';

class RecipeCommunityRepository {
  RecipeCommunityRepository({required this.client});

  final ApiClient client;
  List<RecipeCommunityModel>? community = [];

  Future<List<RecipeCommunityModel>> fetchCommunityRecipes(
      {required String order, bool descending= true}) async {
    if (community!.isNotEmpty) {
      return community!;
    } else {
      var rawCommunity = await client.fetchCommunity(order: order, descending: descending);
      community = rawCommunity
          .map((json) => RecipeCommunityModel.fromJson(json))
          .toList();
      return community!;
    }
  }
}
