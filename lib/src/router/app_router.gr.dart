// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ConfirmPage]
class ConfirmRoute extends PageRouteInfo<ConfirmRouteArgs> {
  ConfirmRoute({
    Key? key,
    required String title,
    required String message,
    required bool success,
    String? email,
    Widget? bottomButton,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmRoute.name,
          args: ConfirmRouteArgs(
            key: key,
            title: title,
            message: message,
            success: success,
            email: email,
            bottomButton: bottomButton,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConfirmRouteArgs>();
      return ConfirmPage(
        key: args.key,
        title: args.title,
        message: args.message,
        success: args.success,
        email: args.email,
        bottomButton: args.bottomButton,
      );
    },
  );
}

class ConfirmRouteArgs {
  const ConfirmRouteArgs({
    this.key,
    required this.title,
    required this.message,
    required this.success,
    this.email,
    this.bottomButton,
  });

  final Key? key;

  final String title;

  final String message;

  final bool success;

  final String? email;

  final Widget? bottomButton;

  @override
  String toString() {
    return 'ConfirmRouteArgs{key: $key, title: $title, message: $message, success: $success, email: $email, bottomButton: $bottomButton}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignUpPage());
    },
  );
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
