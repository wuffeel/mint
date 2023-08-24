part of 'color_theme_bloc.dart';

@immutable
abstract class ColorThemeEvent {}

class ColorThemeSwitchRequested extends ColorThemeEvent {
  ColorThemeSwitchRequested(this.theme);

  final ThemeMode theme;
}
