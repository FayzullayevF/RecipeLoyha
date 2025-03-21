import 'package:flutter/material.dart';

class RecipeMostViewedText extends StatelessWidget {
  const RecipeMostViewedText({super.key, required this.text, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    );
  }
}
