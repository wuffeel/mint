import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/gen/fonts.gen.dart';

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

  static final colorSchemeLight = ColorScheme.fromSwatch(
    accentColor: Colors.white,
    backgroundColor: MintColors.backgroundLight,
    errorColor: MintColors.error,
  );

  static final colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    accentColor: MintColors.backgroundFillDark,
    backgroundColor: MintColors.backgroundDark,
    errorColor: MintColors.error,
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

  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      backgroundColor: MintColors.primaryBlueColor,
      disabledBackgroundColor: MintColors.buttonDisabledColor,
      foregroundColor: Colors.white,
      disabledForegroundColor: MintColors.scaffoldLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
  );
}
