import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_button/sign_button.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/loader.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/welcome/presentation/blocs/animated_container_cubit/animated_container_cubit.dart';

@RoutePage()
class WelcomePage extends StatelessWidget implements AutoRouteWrapper {
  const WelcomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AnimatedContainerCubit>(
            create: (_) => AnimatedContainerCubit(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(
              authenticationRepository: context.read<AuthenticationRepository>(),
              // authCubit: context.read<AuthCubit>(),
              // userRepository: context.read<UserRepository>(),
            ),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(context.appStrings.appName),
        ),
        body: CarouselView(
          // controller: controller,
          itemExtent: double.infinity,
          elevation: 2,
          itemSnapping: true,
          shrinkExtent: 100,
          children: [
            _WelcomeCard(
              message: context.appStrings.welcomeMessage1,
              image: AppAssets.welcomeImage1,
            ),
            _WelcomeCard(
              message: context.appStrings.welcomeMessage2,
              image: AppAssets.welcomeImage2,
            ),
            _WelcomeCard(
              message: context.appStrings.welcomeMessage3,
              image: AppAssets.welcomeImage3,
            ),
            _WelcomeCard(
              message: context.appStrings.welcomeMessage4,
              image: AppAssets.welcomeImage4,
            ),
          ],
        ),
        bottomSheet: BlocBuilder<AnimatedContainerCubit, bool>(
          builder: (context, isOpen) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInBack,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.vertical(
                  top: Radius.circular(24.0),
                ),
                color: context.colorScheme.surfaceContainerHighest,
              ),
              child: BlocConsumer<SignInBloc, SignInState>(
                  listener: (context, state) {
                    if (state is SuccessSignInState) {
                      // //TODO(Vincenzo): controllare il comportamento dell'auth e modificare
                      // context.router.navigate(const MainRoute());

                      // context.router.replaceAll([
                      //   const MainRoute(),
                      // ]);
                    }
                  },
                  builder: (context, state) => switch (state) {
                        SigningInState() => const Loader(),
                        _ => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedCrossFade(
                                firstChild: FilledButton(
                                  onPressed: () =>
                                      context.read<AnimatedContainerCubit>().toogleAnimation(),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      context.appStrings.welcomeCta,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                secondChild: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          context.read<AnimatedContainerCubit>().toogleAnimation(),
                                      icon: const FaIcon(FontAwesomeIcons.xmark),
                                    ),
                                  ],
                                ),
                                crossFadeState:
                                    isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300),
                              ),
                              if (isOpen) const _SignInContent(),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                      }),
            );
          },
        ),
      );
}

class _WelcomeCard extends StatelessWidget {
  final String image, message;

  const _WelcomeCard({
    required this.image,
    required this.message,
  });

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colorScheme.surface.withAlpha(150),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  message,
                  style: context.twelveStyle?.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
}

class _SignInContent extends StatelessWidget {
  const _SignInContent();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          SignInButton(
            buttonType: ButtonType.mail,
            onPressed: () => context.router.navigate(const SignInRoute()),
            btnColor: context.colorScheme.primary,
            btnTextColor: context.colorScheme.onPrimary,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
          ),
          SignInButton(
            buttonType: ButtonType.googleDark,
            onPressed: () => context.read<SignInBloc>().signInWithGoogle(),
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),
          ),
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS)
            SignInButton(
              buttonType: ButtonType.appleDark,
              onPressed: () => context.read<SignInBloc>().signInWithApple(),
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
            ),
          Text(
            context.appStrings.or,
            style: context.twelveStyle?.titleColorSmall,
          ),
          OutlinedButton(
            onPressed: () => context.router.navigate(
              const SignUpRoute(),
            ),
            child: Text(
              context.appStrings.signUpCta,
            ),
          ),
        ],
      );
}
