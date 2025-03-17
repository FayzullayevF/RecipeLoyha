import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/onboarding/presentation/pages/onboarding__last__page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingLastPage extends StatelessWidget {
  const OnboardingLastPage({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: vm,
        builder: (index, child) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            appBar: AppBar(
                backgroundColor: AppColors.mainBackgroundColor,
                leading: Center(
                  child: IconButton(
                    onPressed: (){
                      context.go('/');
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/back-arrow.svg',
                      height: 20 * AppSizes.hRatio,
                      width: 30 * AppSizes.wRatio,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            body: vm.recipeModel == null || vm.recipeModel!.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
                  child: Column(
                      spacing: 10,
                      children: [
                        Onboarding_Last_Page(vm: vm),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3,
                        ),
                        TwoContainer(text: "I have Been Here"),
                      ],
                    ),
                ),
          );
        });
  }
}


class TwoContainer extends StatelessWidget {
  const TwoContainer({super.key, required this.text});
  
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.actionContainerColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.nameColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
