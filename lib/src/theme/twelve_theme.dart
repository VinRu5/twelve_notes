import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';
import 'package:twelve_notes/src/theme/twelve_typography.dart';

class TwelveTheme {
  TwelveTheme._();

  static ThemeData light(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        extensions: [
          TwelveTypographyExtension(Brightness.light),
        ],
        colorScheme: _colorSchemeLight,
        fontFamily: 'Sen',
      );

  static ThemeData dark(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        extensions: [
          TwelveTypographyExtension(Brightness.dark),
        ],
        colorScheme: _colorSchemeDark,
        fontFamily: 'Sen',
      );

  static const _colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: TwelveColors.primary,
    onPrimary: TwelveColors.textLight,
    secondary: TwelveColors.secondaryLight,
    onSecondary: TwelveColors.textLight,
    error: TwelveColors.error,
    onError: TwelveColors.textDark,
    background: TwelveColors.bgLight,
    onBackground: TwelveColors.textLight,
    surface: TwelveColors.surfaceLight,
    onSurface: TwelveColors.textLight,
    outline: TwelveColors.primary,
  );

  static const _colorSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: TwelveColors.primary,
    onPrimary: TwelveColors.textLight,
    secondary: TwelveColors.secondaryDark,
    onSecondary: TwelveColors.textDark,
    error: TwelveColors.error,
    onError: TwelveColors.textDark,
    background: TwelveColors.bgDark,
    onBackground: TwelveColors.textDark,
    surface: TwelveColors.surfaceDark,
    onSurface: TwelveColors.textDark,
    outline: TwelveColors.primary,
  );
}
