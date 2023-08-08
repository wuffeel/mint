import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class MintThemeData {
  static const appBarThemeLight = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    foregroundColor: Colors.black,
  );

  static const appBarThemeDark = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    foregroundColor: Colors.white,
  );

  static const colorSchemeLight = ColorScheme.light(
    primary: MintColors.primaryLightBlueColor,
    secondary: Colors.white,
    error: MintColors.error,
  );

  static const colorSchemeDark = ColorScheme.dark(
    primary: MintColors.primaryDarkBlueColor,
    secondary: MintColors.backgroundFillDark,
    background: MintColors.backgroundDark,
    error: MintColors.error,
  );

  static final textThemeLight = const TextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  );

  static final textThemeDark = const TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  );

  static const iconThemeLight = IconThemeData(color: Colors.black);

  static const iconThemeDark = IconThemeData(color: Colors.white);

  static final elevatedButtonLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      backgroundColor: MintColors.primaryLightBlueColor,
      disabledBackgroundColor: MintColors.buttonDisabledLightColor,
      foregroundColor: Colors.white,
      disabledForegroundColor: MintColors.scaffoldLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      textStyle: MintTextStyles.headline,
    ),
  );

  static final elevatedButtonDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      backgroundColor: MintColors.primaryDarkBlueColor,
      disabledBackgroundColor:
          MintColors.buttonDisabledDarkColor.withOpacity(0.8),
      foregroundColor: Colors.white,
      disabledForegroundColor: MintColors.scaffoldLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      textStyle: MintTextStyles.headline,
    ),
  );

  static final outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      foregroundColor: Colors.black,
      disabledForegroundColor: Colors.black.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      side: const BorderSide(color: MintColors.primaryLightBlueColor),
      textStyle: MintTextStyles.headline,
    ),
  );

  static final outlinedButtonDark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.white.withOpacity(0.6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      side: const BorderSide(color: MintColors.primaryDarkBlueColor),
      textStyle: MintTextStyles.headline,
    ),
  );

  static final bottomNavigationBarLight = BottomNavigationBarThemeData(
    backgroundColor: MintColors.scaffoldLight,
    unselectedItemColor: MintColors.greyLight.withOpacity(0.6),
    selectedItemColor: MintColors.primaryLightBlueColor,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: MintTextStyles.tab,
    unselectedLabelStyle: MintTextStyles.tab,
  );

  static final bottomNavigationBarDark = BottomNavigationBarThemeData(
    backgroundColor: MintColors.scaffoldDark,
    unselectedItemColor: MintColors.greyDark.withOpacity(0.6),
    selectedItemColor: MintColors.primaryDarkBlueColor,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: MintTextStyles.tab,
    unselectedLabelStyle: MintTextStyles.tab,
  );

  static const sliderThemeLight = SliderThemeData(
    activeTrackColor: MintColors.primaryLightBlueColor,
    thumbColor: MintColors.primaryLightBlueColor,
    inactiveTrackColor: MintColors.elementsGreyLight,
    trackHeight: 2,
  );

  static const sliderThemeDark = SliderThemeData(
    activeTrackColor: MintColors.primaryDarkBlueColor,
    thumbColor: MintColors.primaryDarkBlueColor,
    inactiveTrackColor: MintColors.elementsGreyDark,
    trackHeight: 2,
  );

  static final tabBarThemeLight = TabBarTheme(
    indicatorColor: Colors.black,
    labelColor: Colors.black,
    labelStyle: MintTextStyles.tab16,
    unselectedLabelStyle: MintTextStyles.tab16,
    unselectedLabelColor: MintColors.greyLight.withOpacity(0.3),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(width: 2),
    ),
  );

  static final tabBarThemeDark = TabBarTheme(
    indicatorColor: Colors.white,
    labelColor: Colors.white,
    labelStyle: MintTextStyles.tab16,
    unselectedLabelStyle: MintTextStyles.tab16,
    unselectedLabelColor: MintColors.greyDark.withOpacity(0.3),
    indicator: const UnderlineTabIndicator(),
  );

  static final inputDecorationLight = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
    errorStyle: MintTextStyles.caption1,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    hintStyle: MintTextStyles.body.copyWith(
      color: MintColors.greyLight.withOpacity(0.3),
    ),
  );

  static final inputDecorationDark = InputDecorationTheme(
    filled: true,
    fillColor: MintColors.backgroundFillDark,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
    errorStyle: MintTextStyles.caption1,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    hintStyle: MintTextStyles.body.copyWith(
      color: MintColors.greyDark.withOpacity(0.3),
    ),
  );
}
