import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/domain/repositories/user_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/email_field.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/image_background.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/password_field.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/reset_password_modal.dart';
import 'package:twelve_notes/src/errors/errors.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/misc/responsive_builder.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/utils/position_render_mixin.dart';

GlobalKey loginButtonKey = GlobalKey();

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignInBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
          authCubit: context.read<AuthCubit>(),
          userRepository: context.read<UserRepository>(),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              iconSize: 18.0,
              onPressed: () => context.router.navigate(const WelcomeRoute()),
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
            ),
          ),
        ],
        title: Text(
          context.appStrings.titleLogin,
        ),
      ),
      body: ResponsiveBuilder(
        builder: (context, deviceType) {
          if (deviceType == DeviceType.phone) {
            return const _SmallContent();
          }

          return const Row(
            children: [
              Expanded(
                child: ImageBackground(
                  asset: AppAssets.loginBg,
                ),
              ),
              Expanded(
                child: _FormWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SmallContent extends StatefulWidget {
  const _SmallContent();

  @override
  State<_SmallContent> createState() => _SmallContentState();
}

class _SmallContentState extends State<_SmallContent> with PositionRenderMixin {
  double _height = 0.0;

  @override
  void didChangeDependencies() {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      final y = getGlobalHeightPosition(loginButtonKey);
      setState(() {
        _height = y - 16.0;
      });
    });
    super.didChangeDependencies();
  }

  double get height {
    final shouldHeight = MediaQuery.of(context).size.height - _height;

    if (shouldHeight > 0) {
      return shouldHeight;
    }

    return 0.0;
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ImageBackground(
              asset: AppAssets.loginBg,
              height: height,
            ),
          ),
          const _FormWidget(),
        ],
      );
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) => BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SuccessSignInState) {
            context.router.replaceAll([
              const MainRoute(),
            ]);
          }
        },
        builder: (context, state) => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 150.0,
            horizontal: 16.0,
          ),
          shrinkWrap: true,
          children: [
            _SignInWithEmailSection(
              disabled: state is SigningInState,
              errorState: state is ErrorSignInState ? state : null,
            ),
            const SizedBox(height: 60.0),
            _ResetPassword(
              disabled: state is SigningInState,
            ),
          ],
        ),
      );
}

class _SignInWithEmailSection extends StatelessWidget {
  final bool disabled;
  final ErrorSignInState? errorState;

  const _SignInWithEmailSection({
    this.disabled = false,
    this.errorState,
  });

  String? error(BuildContext context) => switch (errorState?.exception) {
        WrongCredentialException() => context.appStrings.loginWrongCredentials,
        AccountUserNotFoundException() => context.appStrings.loginAccountNotExsist,
        null => null,
        _ => context.appStrings.loginGenericError,
      };

  @override
  Widget build(BuildContext context) => FormBuilder(
        key: context.read<SignInBloc>().formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            EmailField(
              name: SignInBloc.emailNameKey,
              disabled: disabled,
              error: error(context),
              onCloseIcon: () => context.read<SignInBloc>().emailField?.reset(),
            ),
            const SizedBox(height: 32.0),
            PasswordField(
              name: SignInBloc.passwordNameKey,
              disabled: disabled,
              error: error(context),
              onCloseIcon: () => context.read<SignInBloc>().passwordField?.reset(),
            ),
            _LoginButton(
              disabled: disabled,
            ),
          ],
        ),
      );
}

class _LoginButton extends StatelessWidget {
  final bool disabled;

  const _LoginButton({
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FilledButton(
        key: loginButtonKey,
        onPressed: disabled ? null : () => context.read<SignInBloc>().onSignIn(),
        child: disabled ? const CircularProgressIndicator() : Text(context.appStrings.ctaLogin),
      ),
    );
  }
}

class _ResetPassword extends StatelessWidget {
  final bool disabled;

  const _ResetPassword({
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Text(context.appStrings.resetPswMessage)),
              Flexible(
                fit: FlexFit.tight,
                child: TextButton(
                  onPressed: disabled
                      ? null
                      : () => showDialog(
                            context: context,
                            builder: (context) => const ResetPasswordModal(),
                          ),
                  child: Text(
                    context.appStrings.resetPswCta,
                    style: context.twelveStyle?.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
