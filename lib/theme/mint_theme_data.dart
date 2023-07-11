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
}
