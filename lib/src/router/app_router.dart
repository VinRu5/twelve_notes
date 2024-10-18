import 'package:auto_route/auto_route.dart';
import 'package:twelve_notes/src/welcome/presentation/pages/welcome_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends RootStackRouter {
  // final AuthCubit _authCubit;

  // AppRouter({
  //   required AuthCubit authCubit,
  // }) : _authCubit = authCubit;

  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  // bool _notGuardingRoute(String route) => [
  //       LoginRoute.name,
  //       RegistrationRoute.name,
  //       WelcomeRoute.name,
  //     ].contains(route);

  // @override
  // void onNavigation(NavigationResolver resolver, StackRouter router) {
  //   if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
  //     resolver.next();
  //   } else {
  //     resolver.redirect(const WelcomeRoute());
  //   }
  // }

  // @override
  // List<AutoRouteGuard> get guards => [
  //       AutoRouteGuard.simple((NavigationResolver resolver, StackRouter router) {
  //         if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
  //           resolver.next();
  //         } else {
  //           resolver.redirect(const WelcomeRoute());
  //         }
  //       }),

  //       // AutoRouteGuard.redirect((NavigationResolver resolver) {
  //       //   if (_authCubit.isAuthenticated || _notGuardingRoute(resolver.route.name)) {
  //       //     return const WelcomeRoute();
  //       //   }

  //       //   return null;
  //       // }),
  //     ];

  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: MainRoute.page),
        // AutoRoute(page: LoginRoute.page),
        // AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: WelcomeRoute.page, initial: true),
      ];
}
