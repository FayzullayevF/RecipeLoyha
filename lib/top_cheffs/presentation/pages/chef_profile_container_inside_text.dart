import 'package:flutter/material.dart';

class ChefProfileContainerInsideText extends StatelessWidget {
  const ChefProfileContainerInsideText({
    super.key, required this.text, required this.count,
  });
final String text;
final String count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              height: 1),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
