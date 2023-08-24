import 'package:flutter/material.dart';

extension ThemeModeToShortString on ThemeMode{
  String toShortString() => toString().split('.').last;
}
