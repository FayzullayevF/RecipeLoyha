import 'package:chef_staff/data/repository/chef_staff_repository.dart';
import 'package:chef_staff/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'package:chef_staff/core/client.dart';
import 'package:flutter/material.dart';

import '../widgets/chef_staff_body.dart';

class ProfileScaffoldTabBar extends StatelessWidget {
  const ProfileScaffoldTabBar({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Center(
        child: ChefStaffBody(
          vm: ChefStaffViewModel(
            repo: ChefStaffRepository(
              client: ApiClient(),
            ),
          ),
        ),
      ),
      Center(
        child:  ChefStaffBody(
          vm: ChefStaffViewModel(
            repo: ChefStaffRepository(
              client: ApiClient(),
            ),
          ),
        ),
      )
    ]);
  }
}
