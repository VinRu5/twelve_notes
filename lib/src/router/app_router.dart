import 'package:auto_route/auto_route.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/pages/login_page.dart';
import 'package:twelve_notes/src/auth/presentation/pages/registration_page.dart';
import 'package:twelve_notes/src/home/presentation/pages/home_page.dart';
import 'package:twelve_notes/src/presentation/pages/main_page.dart';
import 'package:twelve_notes/src/welcome/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  final AuthCubit _authCubit;

  AppRouter({
    required AuthCubit authCubit,
  }) : _authCubit = authCubit;

  @override
  RouteType get defaultRouteType => const RouteType.material();

  bool _notGuardingRoute(String route) => [
        LoginRoute.name,
        RegistrationRoute.name,
        WelcomeRoute.name,
      ].contains(route);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
      resolver.next();
    } else {
      resolver.redirect(const WelcomeRoute());
    }
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/'),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: WelcomeRoute.page),
      ];
}
