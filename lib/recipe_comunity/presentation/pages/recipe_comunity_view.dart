import 'package:chef_staff/core/presentations/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../manager/recipe_comunity_view_model.dart';
import '../widgets/recipe_community_app_bar.dart';
import '../widgets/recipe_community_main_item.dart';

class RecipeCommunityView extends StatelessWidget {
  const RecipeCommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<RecipeCommunityViewModel>();

    return Scaffold(
      extendBody: true,
      appBar: CommunityAppbar(),
      body: vm.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        itemCount: vm.selectedRecipes.length,
        itemBuilder: (context, index) {
          return CommunityDetailItem(index: index);
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}