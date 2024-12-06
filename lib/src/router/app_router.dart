import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/pages/new_password_page.dart';
import 'package:twelve_notes/src/auth/presentation/pages/sign_in_page.dart';
import 'package:twelve_notes/src/auth/presentation/pages/sign_up_page.dart';
import 'package:twelve_notes/src/home/presentation/pages/home_page.dart';
import 'package:twelve_notes/src/library/presentation/pages/library_page.dart';
import 'package:twelve_notes/src/misc/constants.dart';
import 'package:twelve_notes/src/presentation/pages/confirm_page.dart';
import 'package:twelve_notes/src/presentation/pages/main_page.dart';
import 'package:twelve_notes/src/profile/presentation/pages/edit_profile.dart';
import 'package:twelve_notes/src/profile/presentation/pages/profile_page.dart';
import 'package:twelve_notes/src/search/presentation/pages/search_page.dart';
import 'package:twelve_notes/src/utils/logger.dart';
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
        NewPasswordRoute.name,
        ConfirmRoute.name,
      ].contains(route);

  @override
  List<AutoRouteGuard> get guards => [
        AutoRouteGuard.simple((NavigationResolver resolver, StackRouter router) {
          talker.info(resolver.route.name);
          if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
            resolver.next();
          } else {
            resolver.redirect(const WelcomeRoute());
          }
        }),
      ];

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: LibraryRoute.page),
            AutoRoute(page: SearchRoute.page),
          ],
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: TwelveK.loginPath,
        ),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: ConfirmRoute.page),
        AutoRoute(
          page: NewPasswordRoute.page,
          path: TwelveK.newPasswordPath,
        ),
        AutoRoute(page: EditRoute.page),
      ];
}
