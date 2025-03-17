import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/onboarding/presentation/manager/onboarding_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.vm});

  final OnboardingViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => PageView.builder(
        itemCount: vm.pages.length,
        itemBuilder: (context, index) => Scaffold(
          backgroundColor: AppColors.mainBackgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.mainBackgroundColor,
            leading: Center(
                child: SvgPicture.asset(
              'assets/icons/back-arrow.svg',
              height: 20 * AppSizes.hRatio,
              width: 30 * AppSizes.wRatio,
              fit: BoxFit.cover,
            )),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vm.pages[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      vm.pages[index].subtitle,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              Image.network(
                vm.pages[index].image,
                width: double.infinity,
                height: 741,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: 284,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.mainBackgroundColor,
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 48,
                left: 110,
                right: 110,
                child: ElevatedButton(onPressed: (){
                  if(vm.pages.length-1 == index){
                    context.go('/onboarding_last');
                  }
                  vm.controller.nextPage(
                      duration: Duration(microseconds: 300), curve: Curves.linear);
                }, child: Text("Continue", style: TextStyle(color: AppColors.nameColor),))
              )
            ],
          ),
        ),
      ),
    );
  }
}

