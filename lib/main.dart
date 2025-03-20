import 'package:chef_staff/data/models/chef_stuff_model.dart';
import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:chef_staff/data/repository/chef_staff_repository.dart';
import 'package:chef_staff/data/repository/create_review_repository.dart';
import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/presentations/localization_view_model.dart';
import 'package:chef_staff/core/routing/router.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/themes.dart';
import 'package:chef_staff/data/repository/recipe_comunity_repository.dart';
import 'package:chef_staff/data/repository/review_repository.dart';
import 'package:chef_staff/top_cheffs/presentation/manager/top_chefs_bloc.dart';
import 'package:chef_staff/top_cheffs/presentation/pages/top_chefs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    ScreenUtil.init(context, designSize: Size(430, 932));
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => ApiClient(),
        ),
        Provider(
          create: (context) => CategoriesRepository(
            client: context.read(),
          ),
        ),
        Provider(
          create: (context) => RecipeRepository(
            client: context.read(),
          ),
        ),
        Provider(
          create: (context) => RecipeCommunityRepository(
            client: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalizationViewModel(),
        ),
        Provider(
          create: (context) => CreateReviewRepository(
            client: context.read(),
          ),
        ),
        Provider(
          create: (context) => ReviewRepository(
            client: context.read(),
          ),
        ),
        Provider<ChefStaffRepository>(
          create: (context) => ChefStaffRepository(
            client: context.read(),
          ),
        ),
        BlocProvider<ChefsBloc>(
          create: (context) => ChefsBloc(
            chefRepo: context.read<ChefStaffRepository>(),
          ),
        ),
      ],
      child: Builder(
        builder: (context) => MaterialApp.router(
          theme: AppThemes.darkThemes,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("uz"),
            Locale("ru"),
            Locale("en"),
          ],
          locale: context.watch<LocalizationViewModel>().currentLocale,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
