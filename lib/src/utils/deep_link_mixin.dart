import 'package:auto_route/auto_route.dart';
import 'package:twelve_notes/src/misc/constants.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/utils/logger.dart';

mixin DeepLinkMixin {
  Future<Uri> deepLinkTransformer(Uri uri) async {
    talker.warning('🎸 uri>> $uri');
    return uri;
  }

  Future<DeepLink> deepLinkBuilder(PlatformDeepLink deepLink) async {
    talker.warning('🎸 dl>> $deepLink');

    return switch (deepLink.path) {
      (final String p) when p.startsWith(TwelveK.newPasswordPath) =>
        const DeepLink([NewPasswordRoute()]),
      (final String p) when p.startsWith(TwelveK.loginPath) => _handleConfirmLink(deepLink),
      _ => DeepLink.defaultPath,
    };
  }

  DeepLink _handleConfirmLink(PlatformDeepLink deepLink) {
    talker.warning('🎸 >> ${deepLink.path}');
    return DeepLink.single(
      const SignInRoute(),
    );
  }
}
