import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mint/utils/theme_mode_to_short_string.dart';

part 'color_theme_event.dart';

part 'color_theme_state.dart';

class ColorThemeBloc extends HydratedBloc<ColorThemeEvent, ColorThemeState> {
  ColorThemeBloc() : super(const ColorThemeState()) {
    on<ColorThemeSwitchRequested>(
      (event, emit) => emit(ColorThemeState(theme: event.theme)),
    );
  }

  @override
  ColorThemeState? fromJson(Map<String, dynamic> json) {
    final theme = json['theme'] as String?;
    if (theme != null) {
      return ColorThemeState(theme: _getProperTheme(theme));
    }
    return const ColorThemeState();
  }

  @override
  Map<String, dynamic>? toJson(ColorThemeState state) {
    return {'theme': state.theme?.toShortString()};
  }

  ThemeMode? _getProperTheme(String theme) {
    for (final appTheme in ThemeMode.values) {
      if (appTheme.toShortString() == theme) {
        return appTheme;
      }
    }
    return null;
  }
}
