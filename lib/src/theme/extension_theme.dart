import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_typography.dart';

extension ExtensionTheme on BuildContext {
  TwelveTypographyExtension? get twelveStyle =>
      Theme.of(this).extension<TwelveTypographyExtension>();

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
