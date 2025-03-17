import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';

class RecipeAppBarBottomItem extends StatelessWidget {
  const RecipeAppBarBottomItem({
    super.key,
    required this.callback,
    required this.title,
    required this.isSelected
  });
  final String title;
  final VoidCallback callback;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.nameColor : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "League Spartan",
              fontSize: 16,
              color: isSelected ? Colors.white : AppColors.nameColor,
            ),
          )),
    );
  }
}
