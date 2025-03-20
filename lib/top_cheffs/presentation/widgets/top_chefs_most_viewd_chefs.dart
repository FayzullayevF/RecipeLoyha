import 'package:chef_staff/core/utils/utils.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chef_state.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chefs_bloc.dart';
import 'package:chef_staff/top_cheffs/presentation/widgets/top_chefs_most_viewed_chefs_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopChefsMostViewedChefs extends StatelessWidget {
  const TopChefsMostViewedChefs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefsBloc, ChefsState>(
      builder: (context, state) => Column(
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
      ),
    );
  }
}
