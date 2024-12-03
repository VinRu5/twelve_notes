import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

@RoutePage()
class ConfirmPage extends StatelessWidget {
  final String title;
  final String message;
  final String? email;
  final bool success;
  final Widget? bottomButton;

  const ConfirmPage({
    super.key,
    required this.title,
    required this.message,
    required this.success,
    this.email,
    this.bottomButton,
  });

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.appStrings.appName),
            automaticallyImplyLeading: false,
          ),
          body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 60.0),
                  Text(
                    title,
                    style: context.twelveStyle?.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: FaIcon(
                      success ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circleXmark,
                      size: 96.0,
                      color: success ? TwelveColors.success : TwelveColors.error,
                    ),
                  ),
                  Text(
                    message,
                    style: context.twelveStyle?.bodyMedium,
                  )
                ],
              ),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: bottomButton,
            ),
          ),
        ),
      );
}
