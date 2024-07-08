import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/di/dependency_injector.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/twelve_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final AppRouter _router;

  const App({
    super.key,
    required AppRouter router,
  }) : _router = router;

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context).appName,
          localizationsDelegates: const [
            FormBuilderLocalizationsDelegate(),
            ...AppLocalizations.localizationsDelegates,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: TwelveTheme.light,
          darkTheme: TwelveTheme.dark,
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
          routerConfig: _router.config(),
        ),
      );
}
