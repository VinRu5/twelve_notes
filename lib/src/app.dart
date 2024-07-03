import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/mockup_widget.dart';
import 'package:twelve_notes/src/theme/twelve_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: AppLocalizations.of(context).appName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: TwelveTheme.light,
        darkTheme: TwelveTheme.dark,
        home: MockupWidget(),
      );
}
