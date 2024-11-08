import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/pages/sign_in_page.dart';
import 'package:twelve_notes/src/auth/presentation/pages/sign_up_page.dart';
import 'package:twelve_notes/src/presentation/pages/confirm_page.dart';
import 'package:twelve_notes/src/presentation/pages/main_page.dart';
import 'package:twelve_notes/src/welcome/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  final AuthCubit _authCubit;

  AppRouter({
    required AuthCubit authCubit,
  }) : _authCubit = authCubit;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  bool _notGuardingRoute(String route) => [
        SignInRoute.name,
        SignUpRoute.name,
        WelcomeRoute.name,
      ].contains(route);

  @override
  List<AutoRouteGuard> get guards => [
        AutoRouteGuard.simple((NavigationResolver resolver, StackRouter router) {
          if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
            resolver.next();
          } else {
            resolver.redirect(const WelcomeRoute());
          }
        }),
      ];

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: ConfirmRoute.page),
      ];
}
