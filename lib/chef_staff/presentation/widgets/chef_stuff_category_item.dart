
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefStuffCategoryItem extends StatelessWidget {
  const ChefStuffCategoryItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rating,
    required this.time,
  });

  final String title, desc, image;
  final num rating, time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -73,
              right: 2,
              left: 2,
              child: Container(
                  width: 159.5 * AppSizes.wRatio,
                  height: 83 * AppSizes.hRatio,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1,),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF3E2823),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        desc,
                        style: const TextStyle(
                            color: Color(0xFF3E2823),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none),
                        maxLines: 2,
                      ),
                      SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Text(
                                  rating.toString(),
                                  style: TextStyle(
                                      color: Color(0xFFEC888D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none),
                                ),
                                SvgPicture.asset("assets/icons/star.svg"),
                              ],
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                SvgPicture.asset('assets/icons/clock.svg'),
                                Text(
                                  "${time.toString()} min",
                                  style: TextStyle(
                                    color: Color(0xFFEC888D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 153 * AppSizes.hRatio,
                width: 169 * AppSizes.wRatio,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 28 * AppSizes.wRatio,
                height: 28 * AppSizes.hRatio,
                 decoration: BoxDecoration(
                  color: AppColors.nameColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: SvgPicture.asset('assets/icons/heart.svg')),
              ),
            )
          ],
        )
      ],
    );
  }
}
