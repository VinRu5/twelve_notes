import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/di/dependency_injector.dart';

import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/twelve_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  AppRouter getRouter(AuthCubit authCubit) => AppRouter(authCubit: authCubit);

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
            routerConfig: getRouter(context.read<AuthCubit>()).config(
              reevaluateListenable: ReevaluateListenable.stream(context.read<AuthCubit>().stream),
            ),
          ),
        ),
      );
}
