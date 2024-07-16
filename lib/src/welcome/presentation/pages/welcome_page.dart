import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_button/sign_button.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/carousel/carousel_widget.dart';
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
            ),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.appStrings.appName),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(
              24.0,
              40.0,
              24.0,
              100.0,
            ),
            child: CarouselWidget(
              views: [
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
                        //TODO(Vincenzo): controllare il comportamento dell'auth e modificare
                        context.router.navigate(const MainRoute());
                      }
                    },
                    builder: (context, state) => switch (state) {
                          SigningInState() => const _Loader(),
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
                                        onPressed: () => context
                                            .read<AnimatedContainerCubit>()
                                            .toogleAnimation(),
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
        ),
      );
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              strokeWidth: 7,
              strokeCap: StrokeCap.round,
            ),
          ),
        ],
      );
}

class _WelcomeCard extends StatelessWidget {
  final String image, message;

  const _WelcomeCard({
    required this.image,
    required this.message,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(
          32.0,
          0.0,
          32.0,
          50.0,
        ),
        child: Card(
          shadowColor: context.colorScheme.primary,
          elevation: 2,
          clipBehavior: Clip.hardEdge,
          child: Container(
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colorScheme.surface.withAlpha(150),
                  borderRadius: const BorderRadiusDirectional.vertical(
                    top: Radius.circular(16.0),
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
            onPressed: () => context.router.navigate(
              const LoginRoute(),
            ),
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
              const RegistrationRoute(),
            ),
            child: Text(
              context.appStrings.signUpCta,
            ),
          ),
        ],
      );
}
