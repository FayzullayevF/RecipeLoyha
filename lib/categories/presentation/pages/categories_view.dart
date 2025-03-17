import 'package:chef_staff/categories/presentation/manager/categories_cubit.dart';
import 'package:chef_staff/categories/presentation/widgets/categories_item.dart';
import 'package:chef_staff/categories/presentation/widgets/recipe_appbar.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder:(context, state)=> RefreshIndicator(
        onRefresh: () async => context.read<CategoriesBloc>().add(CategoriesLoading()),
        child: Scaffold(
          extendBody:  true,
          backgroundColor: AppColors.mainBackgroundColor,
          appBar: RecipeAppbar(title: "Categories",),
          body: CategoryPageItem(),
        ),
      ),
    );
  }
}

class CategoryPageItem extends StatelessWidget {
  const CategoryPageItem({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc,CategoriesState>(
      builder:(context, state)=> ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(38.w, 20.h, 38.w, 100.h),
        children: [
          if (state.mainCategory != null)
            CategoriesItem(
              category: state.mainCategory!,
            ),
          SizedBox(
            height: 35,
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: CategoriesItem(category: state.categories[index]));
            },
          ),
        ],
      ),
    );
  }
}
