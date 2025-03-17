import 'package:chef_staff/authentication/presentation/manager/sign_up_view_model.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDateOfBirthField extends StatelessWidget {
  const RecipeDateOfBirthField({super.key});

  @override
  Widget build(BuildContext context) {
    var date = context.select((SignUpViewModel vm)=> vm.selectedDate);
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date of Birth",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () async {
              context.read<SignUpViewModel>().selectedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
            },
            child: Container(
              width: 350,
              height: 48,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: AppSizes.padding38,
              ),
              decoration: BoxDecoration(
                color: AppColors.actionContainerColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
               date == null ? "DD/MM/YYYY" : "${date.day}/${date.month}/${date.year}",
                style: TextStyle(
                  color: AppColors.mainBackgroundColor.withValues(alpha: 0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
