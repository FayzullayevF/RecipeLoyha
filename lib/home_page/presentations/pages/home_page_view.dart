import 'package:chef_staff/home_page/presentations/widgets/home_page_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: HomePageAppBar(),
    );
  }
}