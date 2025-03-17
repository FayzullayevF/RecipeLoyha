import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class OnboardingLastPageButtons extends StatelessWidget {
  const OnboardingLastPageButtons(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.nameColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ));
  }
}
