import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Onboarding_Last_Page extends StatelessWidget {
  const Onboarding_Last_Page({
    super.key,
    required this.vm,
  });

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 27, crossAxisSpacing: 24),
        itemBuilder: (BuildContext context, index) {
          return SizedBox(
            height: 500,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  vm.recipeModel![index].photo,
                  fit: BoxFit.cover,
                  height: 166,
                  width: 167,
                )),
          );
        },
      ),
    );
  }
}
