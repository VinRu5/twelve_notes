import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';
import 'package:twelve_notes/src/theme/twelve_typography.dart';

class TwelveTheme {
  TwelveTheme._();

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        extensions: [
          _typographyLight,
        ],
        colorScheme: _colorSchemeLight,
        fontFamily: 'Sen',
        dividerTheme: _dividerTheme,
        appBarTheme: _appBarThemeLight,
        navigationBarTheme: _navigationBarThemeLight,
        filledButtonTheme: _filledButtonThemeDataLight,
        elevatedButtonTheme: _elevatedButtonThemeDataLight,
        outlinedButtonTheme: _outlinedButtonThemeDataLight,
        textButtonTheme: _textButtonThemeDataLight,
        iconButtonTheme: _iconButtonThemeDataLight,
        inputDecorationTheme: _inputDecorationThemeLight,
        searchBarTheme: _searchBarThemeDataLight,
        searchViewTheme: _searchViewThemeDataLight,
        chipTheme: _chipThemeDataLight,
        cardTheme: _cardThemeDataLight,
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        extensions: [
          _typographyDark,
        ],
        colorScheme: _colorSchemeDark,
        fontFamily: 'Sen',
        dividerTheme: _dividerTheme,
        appBarTheme: _appBarThemeDark,
        navigationBarTheme: _navigationBarThemeDark,
        filledButtonTheme: _filledButtonThemeDataDark,
        elevatedButtonTheme: _elevatedButtonThemeDataDark,
        outlinedButtonTheme: _outlinedButtonThemeDataDark,
        textButtonTheme: _textButtonThemeDataDark,
        iconButtonTheme: _iconButtonThemeDataDark,
        inputDecorationTheme: _inputDecorationThemeDark,
        searchBarTheme: _searchBarThemeDataDark,
        searchViewTheme: _searchViewThemeDataDark,
        chipTheme: _chipThemeDataDark,
        cardTheme: _cardThemeDataDark,
      );

  static final TwelveTypographyExtension _typographyLight =
      TwelveTypographyExtension(Brightness.light);

  static final TwelveTypographyExtension _typographyDark =
      TwelveTypographyExtension(Brightness.dark);

  static const ColorScheme _colorSchemeLight = ColorScheme(
    brightness: Brightness.light,
    primary: TwelveColors.primary,
    onPrimary: TwelveColors.textLight,
    secondary: TwelveColors.secondaryLight,
    onSecondary: TwelveColors.textLight,
    error: TwelveColors.error,
    onError: TwelveColors.textDark,
    surface: TwelveColors.bgLight,
    onSurface: TwelveColors.textLight,
    surfaceContainerHighest: TwelveColors.surfaceLight,
    outline: TwelveColors.primary,
  );
  static const ColorScheme _colorSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: TwelveColors.primary,
    onPrimary: TwelveColors.textLight,
    secondary: TwelveColors.secondaryDark,
    onSecondary: TwelveColors.textDark,
    error: TwelveColors.error,
    onError: TwelveColors.textDark,
    surface: TwelveColors.bgDark,
    onSurface: TwelveColors.textDark,
    surfaceContainerHighest: TwelveColors.surfaceDark,
    outline: TwelveColors.primary,
  );

  static const DividerThemeData _dividerTheme = DividerThemeData(
    color: TwelveColors.primary,
  );

  static const AppBarTheme _appBarThemeLight = AppBarTheme(
    surfaceTintColor: TwelveColors.bgLight,
    color: TwelveColors.bgLight,
    centerTitle: true,
  );
  static const AppBarTheme _appBarThemeDark = AppBarTheme(
    surfaceTintColor: TwelveColors.bgDark,
    color: TwelveColors.bgDark,
    centerTitle: true,
  );

  static const NavigationBarThemeData _navigationBarThemeLight = NavigationBarThemeData(
    elevation: 0,
    indicatorColor: TwelveColors.primary,
    indicatorShape: StadiumBorder(),
    backgroundColor: TwelveColors.bgLight,
  );
  static const NavigationBarThemeData _navigationBarThemeDark = NavigationBarThemeData(
    elevation: 0,
    indicatorColor: TwelveColors.primary,
    indicatorShape: StadiumBorder(),
    backgroundColor: TwelveColors.bgDark,
  );

  static final FilledButtonThemeData _filledButtonThemeDataLight = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  static final FilledButtonThemeData _filledButtonThemeDataDark = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeDataLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  static final ElevatedButtonThemeData _elevatedButtonThemeDataDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  static final TextButtonThemeData _textButtonThemeDataLight = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  static final TextButtonThemeData _textButtonThemeDataDark = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonThemeDataLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  static final OutlinedButtonThemeData _outlinedButtonThemeDataDark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  static final IconButtonThemeData _iconButtonThemeDataLight = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TwelveColors.primary,
    ),
  );
  static final IconButtonThemeData _iconButtonThemeDataDark = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TwelveColors.primary,
      foregroundColor: TwelveColors.textLight,
    ),
  );

  static final InputDecorationTheme _inputDecorationThemeLight = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
    filled: true,
    errorStyle: _typographyLight.errorStyle,
  );
  static final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
    filled: true,
    errorStyle: _typographyDark.errorStyle,
  );

  static const SearchBarThemeData _searchBarThemeDataLight = SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(TwelveColors.surfaceLight),
    shadowColor: WidgetStatePropertyAll(TwelveColors.primary),
    surfaceTintColor: WidgetStatePropertyAll(Colors.white54),
    shape: WidgetStatePropertyAll(
      ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    ),
  );
  static const SearchBarThemeData _searchBarThemeDataDark = SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(TwelveColors.surfaceDark),
    shadowColor: WidgetStatePropertyAll(TwelveColors.primary),
    surfaceTintColor: WidgetStatePropertyAll(TwelveColors.surfaceLight),
    shape: WidgetStatePropertyAll(
      ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
    ),
  );

  static const SearchViewThemeData _searchViewThemeDataLight = SearchViewThemeData(
    backgroundColor: TwelveColors.surfaceLight,
    surfaceTintColor: Colors.white54,
  );
  static const SearchViewThemeData _searchViewThemeDataDark = SearchViewThemeData(
    backgroundColor: TwelveColors.surfaceDark,
    surfaceTintColor: TwelveColors.surfaceLight,
  );

  static const ChipThemeData _chipThemeDataLight = ChipThemeData(
    selectedColor: TwelveColors.primary,
    showCheckmark: false,
  );
  static const ChipThemeData _chipThemeDataDark = ChipThemeData(
    selectedColor: TwelveColors.primary,
    showCheckmark: false,
  );

  static const CardTheme _cardThemeDataLight = CardTheme(
    color: TwelveColors.surfaceLight,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
    ),
  );
  static const CardTheme _cardThemeDataDark = CardTheme(
    color: TwelveColors.surfaceDark,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
    ),
  );
}
