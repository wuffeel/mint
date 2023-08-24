import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/gen/fonts.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/routes/app_router.dart';
import 'package:mint/theme/mint_theme_data.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  void _hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => _hideKeyboard(context),
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: MintFontFamily.inter,
              primaryColor: Colors.black,
              appBarTheme: MintThemeData.appBarThemeLight,
              colorScheme: MintThemeData.colorSchemeLight,
              textTheme: MintThemeData.textThemeLight,
              iconTheme: MintThemeData.iconThemeLight,
              hintColor: MintColors.greyLight,
              elevatedButtonTheme: MintThemeData.elevatedButtonLight,
              outlinedButtonTheme: MintThemeData.outlinedButtonLight,
              scaffoldBackgroundColor: MintColors.scaffoldLight,
              bottomNavigationBarTheme: MintThemeData.bottomNavigationBarLight,
              dividerColor: MintColors.separatorLight,
              sliderTheme: MintThemeData.sliderThemeLight,
              tabBarTheme: MintThemeData.tabBarThemeLight,
              inputDecorationTheme: MintThemeData.inputDecorationLight,
              dividerTheme: const DividerThemeData(thickness: 1, space: 1),
            ),
            darkTheme: ThemeData(
              fontFamily: MintFontFamily.inter,
              primaryColor: Colors.white,
              appBarTheme: MintThemeData.appBarThemeDark,
              colorScheme: MintThemeData.colorSchemeDark,
              textTheme: MintThemeData.textThemeDark,
              iconTheme: MintThemeData.iconThemeDark,
              hintColor: MintColors.greyDark,
              elevatedButtonTheme: MintThemeData.elevatedButtonDark,
              outlinedButtonTheme: MintThemeData.outlinedButtonDark,
              scaffoldBackgroundColor: MintColors.scaffoldDark,
              bottomNavigationBarTheme: MintThemeData.bottomNavigationBarDark,
              dividerColor: MintColors.separatorDark.withOpacity(0.6),
              sliderTheme: MintThemeData.sliderThemeDark,
              tabBarTheme: MintThemeData.tabBarThemeDark,
              inputDecorationTheme: MintThemeData.inputDecorationDark,
              dividerTheme: const DividerThemeData(thickness: 1, space: 1),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _appRouter.config(),
          ),
        );
      },
    );
  }
}
