import 'package:chef_staff/data/repository/categories_repository.dart';
import 'package:chef_staff/data/repository/recipe_repository.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/presentations/localization_view_model.dart';
import 'package:chef_staff/core/routing/router.dart';
import 'package:chef_staff/core/sizes.dart';
import 'package:chef_staff/core/utils/themes.dart';
import 'package:chef_staff/data/repository/recipe_comunity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      ],
      builder: (context, child) => MaterialApp.router(
        theme: AppThemes.darkThemes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: [
          Locale("uz"),
          Locale("ru"),
          Locale("en"),
        ],
        locale: context.watch<LocalizationViewModel>().currentLocale,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
