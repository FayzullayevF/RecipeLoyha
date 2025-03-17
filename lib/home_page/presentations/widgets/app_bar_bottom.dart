import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/home_page/presentations/manager/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarBottom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key, required this.vm});
  final HomePageViewModel vm;


  @override
  Size get preferredSize => const Size(double.infinity, 40);

  @override
  State<AppBarBottom> createState() => _AppBarBottomState();
}

class _AppBarBottomState extends State<AppBarBottom> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: widget.vm.category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.nameColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                  child: Text(
                widget.vm.category[index] as String,
                style: TextStyle(
                  color: selectedIndex == index
                      ? Colors.white
                      : AppColors.nameColor,
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
