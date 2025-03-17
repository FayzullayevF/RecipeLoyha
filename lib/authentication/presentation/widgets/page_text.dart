import 'package:flutter/material.dart';

class PageText extends StatelessWidget {
  const PageText({
    super.key,
    required this.title,
    required this.size,
    required this.weight,
  });

  final String title;
  final double size;
  final double weight;

  FontWeight getFontWeight({required double weight}) {
    if (weight <= 100) return FontWeight.w100;
    if (weight <= 200) return FontWeight.w200;
    if (weight <= 300) return FontWeight.w300;
    if (weight <= 400) return FontWeight.w400;
    if (weight <= 500) return FontWeight.w500;
    if (weight <= 600) return FontWeight.w600;
    if (weight <= 700) return FontWeight.w700;
    if (weight <= 800) return FontWeight.w800;
    return FontWeight.w900;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: getFontWeight(weight: weight),
      ),
    );
  }
}
