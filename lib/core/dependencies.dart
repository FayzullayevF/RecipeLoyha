
import 'package:chef_staff/data/repository/auth_repository.dart';
import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/data/repository/chef_staff_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/data/repository/onboarding_page_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context)=> ApiClient()),
  Provider(create: (context)=> AuthRepository(client: context.read())),
  Provider(create: (context)=> CategoriesRepository(client: context.read())),
  Provider(create: (context)=> ChefStaffRepository(client: context.read())),
  Provider(create: (context)=> OnboardingRepository(client: context.read())),
  Provider(create: (context)=> RecipeRepository(client: context.read()))
];