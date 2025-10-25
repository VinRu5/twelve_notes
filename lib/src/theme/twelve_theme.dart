import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';
import 'package:twelve_notes/src/theme/twelve_typography.dart';

class TwelveTheme {
  TwelveTheme._();

  static TwelveTheme? _instance;

  static TwelveTheme get instance => _instance ??= TwelveTheme._();

  ThemeData get light => ThemeData(
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

  ThemeData get dark => ThemeData(
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

  TwelveTypographyExtension get _typographyLight => TwelveTypographyExtension(Brightness.light);

  TwelveTypographyExtension get _typographyDark => TwelveTypographyExtension(Brightness.dark);

  final ColorScheme _colorSchemeLight = ColorScheme(
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
  final ColorScheme _colorSchemeDark = ColorScheme(
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

  final DividerThemeData _dividerTheme = DividerThemeData(
    color: TwelveColors.primary,
  );

  final AppBarTheme _appBarThemeLight = AppBarTheme(
    surfaceTintColor: TwelveColors.bgLight,
    backgroundColor: TwelveColors.bgLight,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24.0),
      ),
    ),
  );
  final AppBarTheme _appBarThemeDark = AppBarTheme(
    surfaceTintColor: TwelveColors.bgDark,
    backgroundColor: TwelveColors.bgDark,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(32),
      ),
    ),
  );

  final NavigationBarThemeData _navigationBarThemeLight = NavigationBarThemeData(
    elevation: 0,
    indicatorColor: TwelveColors.primary,
    indicatorShape: StadiumBorder(),
    backgroundColor: TwelveColors.bgLight,
  );
  final NavigationBarThemeData _navigationBarThemeDark = NavigationBarThemeData(
    elevation: 0,
    indicatorColor: TwelveColors.primary,
    indicatorShape: StadiumBorder(),
    backgroundColor: TwelveColors.bgDark,
  );

  late final FilledButtonThemeData _filledButtonThemeDataLight = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  late final FilledButtonThemeData _filledButtonThemeDataDark = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  late final ElevatedButtonThemeData _elevatedButtonThemeDataLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  late final ElevatedButtonThemeData _elevatedButtonThemeDataDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  late final TextButtonThemeData _textButtonThemeDataLight = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  late final TextButtonThemeData _textButtonThemeDataDark = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  late final OutlinedButtonThemeData _outlinedButtonThemeDataLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _typographyLight.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
  late final OutlinedButtonThemeData _outlinedButtonThemeDataDark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: _typographyDark.buttonText,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  final IconButtonThemeData _iconButtonThemeDataLight = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TwelveColors.primary,
    ),
  );
  final IconButtonThemeData _iconButtonThemeDataDark = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: TwelveColors.primary,
      foregroundColor: TwelveColors.textLight,
    ),
  );

  late final InputDecorationTheme _inputDecorationThemeLight = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
    filled: true,
    errorStyle: _typographyLight.errorStyle,
  );
  late final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24.0)),
    ),
    filled: true,
    errorStyle: _typographyDark.errorStyle,
  );

  final SearchBarThemeData _searchBarThemeDataLight = SearchBarThemeData(
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
  final SearchBarThemeData _searchBarThemeDataDark = SearchBarThemeData(
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

  final SearchViewThemeData _searchViewThemeDataLight = SearchViewThemeData(
    backgroundColor: TwelveColors.surfaceLight,
    surfaceTintColor: Colors.white54,
  );
  final SearchViewThemeData _searchViewThemeDataDark = SearchViewThemeData(
    backgroundColor: TwelveColors.surfaceDark,
    surfaceTintColor: TwelveColors.surfaceLight,
  );

  final ChipThemeData _chipThemeDataLight = ChipThemeData(
    selectedColor: TwelveColors.primary,
    showCheckmark: false,
  );
  final ChipThemeData _chipThemeDataDark = ChipThemeData(
    selectedColor: TwelveColors.primary,
    showCheckmark: false,
  );

  final CardThemeData _cardThemeDataLight = CardThemeData(
    color: TwelveColors.surfaceLight,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
    ),
  );

  final CardThemeData _cardThemeDataDark = CardThemeData(
    color: TwelveColors.surfaceDark,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
    ),
  );
}
