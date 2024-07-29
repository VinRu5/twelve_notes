import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class TwelveErrorCard extends StatelessWidget {
  final String errorMessage;

  const TwelveErrorCard({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) => Card(
        color: TwelveColors.error,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: FaIcon(
                  FontAwesomeIcons.triangleExclamation,
                  size: 18.0,
                  color: TwelveColors.textDark,
                ),
              ),
              Expanded(
                child: Text(
                  errorMessage,
                  style: context.twelveStyle?.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: TwelveColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
