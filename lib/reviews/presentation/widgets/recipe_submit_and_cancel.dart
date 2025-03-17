import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeSubmitAndCancel extends StatelessWidget {
  const RecipeSubmitAndCancel(
      {super.key,
      required this.color,
      required this.textColor,
      required this.text, required this.callback});

  final Color color, textColor;
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: Container(
        width: 159.w,
        height: 29.h,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),
    );
  }
}
