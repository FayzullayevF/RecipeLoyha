import 'package:chef_staff/top_cheffs/presentation/widgets/top_chefs_most_viewed_chefs_stack.dart';
import 'package:flutter/material.dart';

class TopChefsMostViewedChefs extends StatelessWidget {
  const TopChefsMostViewedChefs({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TopChefsMostViewedChefsStack(),
            SizedBox(
              width: 10,
            ),
            TopChefsMostViewedChefsStack(),
          ],
        ),
      ],
    );
  }
}
