import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class TwelveTypographyExtension extends ThemeExtension<TwelveTypographyExtension> {
  TwelveTypographyExtension(
    this.brightness, {
    this.headlineLarge = const TextStyle(
      fontFamily: 'Viga',
      fontSize: 32,
      height: 38 / 32,
      letterSpacing: 0,
    ),
    this.headlineMedium = const TextStyle(
      fontFamily: 'Viga',
      fontSize: 24,
      height: 28 / 24,
      letterSpacing: 0,
    ),
    this.headlineSmall = const TextStyle(
      fontFamily: 'Viga',
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.titleLarge = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      height: 38 / 32,
      letterSpacing: 0,
    ),
    this.titleMedium = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      height: 28 / 24,
      letterSpacing: 0,
    ),
    this.titleSmall = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.titleColorLarge = const TextStyle(
      fontWeight: FontWeight.bold,
      color: TwelveColors.primary,
      fontSize: 32,
      height: 38 / 32,
      letterSpacing: 0,
    ),
    this.titleColorMedium = const TextStyle(
      fontWeight: FontWeight.bold,
      color: TwelveColors.primary,
      fontSize: 24,
      height: 28 / 24,
      letterSpacing: 0,
    ),
    this.titleColorSmall = const TextStyle(
      fontWeight: FontWeight.bold,
      color: TwelveColors.primary,
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.bodyLarge = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.bodyMedium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 19 / 16,
      letterSpacing: 0,
    ),
    this.bodySmall = const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: 0,
    ),
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    this.chordLarge = const TextStyle(
      fontFamily: 'UbuntuMono',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      height: 28 / 24,
      letterSpacing: 0,
    ),
    this.chordMedium = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'UbuntuMono',
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.chordSmall = const TextStyle(
      fontFamily: 'UbuntuMono',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 19 / 16,
      letterSpacing: 0,
    ),
    this.buttonText = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 21 / 18,
      letterSpacing: 0,
    ),
    this.errorStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: .2,
    ),
  })  : labelLarge = TextStyle(
          color: brightness == Brightness.light
              ? TwelveColors.textLabelLight
              : TwelveColors.textLabelDark,
          fontSize: 16,
          height: 19 / 16,
          letterSpacing: 0,
        ),
        labelMedium = TextStyle(
          color: brightness == Brightness.light
              ? TwelveColors.textLabelLight
              : TwelveColors.textLabelDark,
          fontSize: 14,
          height: 16 / 14,
          letterSpacing: 0,
        ),
        labelSmall = TextStyle(
          color: brightness == Brightness.light
              ? TwelveColors.textLabelLight
              : TwelveColors.textLabelDark,
          fontSize: 12,
          height: 14 / 12,
          letterSpacing: 0,
        );

  // /// The overall brightness of this text theme extension.
  final Brightness brightness;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;

  final TextStyle titleColorLarge;
  final TextStyle titleColorMedium;
  final TextStyle titleColorSmall;

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;

  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  final TextStyle chordLarge;
  final TextStyle chordMedium;
  final TextStyle chordSmall;

  final TextStyle buttonText;

  final TextStyle errorStyle;

  @override
  TwelveTypographyExtension copyWith({
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? titleColorLarge,
    TextStyle? titleColorMedium,
    TextStyle? titleColorSmall,
    TextStyle? buttonText,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? chordLarge,
    TextStyle? chordMedium,
    TextStyle? chordSmall,
    TextStyle? errorStyle,
  }) {
    return TwelveTypographyExtension(
      brightness,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      titleColorLarge: titleColorLarge ?? this.titleColorLarge,
      titleColorMedium: titleColorMedium ?? this.titleColorMedium,
      titleColorSmall: titleColorSmall ?? this.titleColorSmall,
      buttonText: buttonText ?? this.buttonText,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      chordLarge: chordLarge ?? this.chordLarge,
      chordMedium: chordMedium ?? this.chordMedium,
      chordSmall: chordSmall ?? this.chordSmall,
      errorStyle: errorStyle ?? this.errorStyle,
    );
  }

  @override
  TwelveTypographyExtension lerp(
      covariant ThemeExtension<TwelveTypographyExtension>? other, double t) {
    if (other is! TwelveTypographyExtension) {
      return this;
    }
    return TwelveTypographyExtension(
      brightness,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      titleColorLarge: TextStyle.lerp(titleColorLarge, other.titleColorLarge, t)!,
      titleColorMedium: TextStyle.lerp(titleColorMedium, other.titleColorMedium, t)!,
      titleColorSmall: TextStyle.lerp(titleColorSmall, other.titleColorSmall, t)!,
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      chordLarge: TextStyle.lerp(chordLarge, other.chordLarge, t)!,
      chordMedium: TextStyle.lerp(chordMedium, other.chordMedium, t)!,
      chordSmall: TextStyle.lerp(chordSmall, other.chordSmall, t)!,
    );
  }
}
