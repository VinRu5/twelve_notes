import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/di/dependency_injector.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/twelve_theme.dart';
import 'package:twelve_notes/src/utils/logger.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  // AppRouter getRouter(AuthCubit authCubit) => AppRouter(authCubit: authCubit);
  AppRouter getRouter() => AppRouter();

  @override
  Widget build(BuildContext context) => DependencyInjector(
        child: Builder(
          builder: (context) => MaterialApp.router(
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
            routerConfig: getRouter().config(
              // reevaluateListenable: ReevaluateListenable.stream(context.read<AuthCubit>().stream),
              deepLinkTransformer: (uri) async {
                talker.warning(uri);
                return uri;
              },
              deepLinkBuilder: (deepLink) async {
                talker.warning(deepLink);
                return deepLink;
              },
            ),
          ),
        ),
      );
}
