import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/email_field.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/image_background.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/password_field.dart';
import 'package:twelve_notes/src/errors/errors.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/misc/responsive_builder.dart';
import 'package:twelve_notes/src/presentation/widgets/twelve_error_card.dart';
import 'package:twelve_notes/src/router/app_router.dart';

@RoutePage()
class SignUpPage extends StatelessWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignUpBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
          // authCubit: context.read<AuthCubit>(),
          // userRepository: context.read<UserRepository>(),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
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
            context.appStrings.titleRegister,
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
                    asset: AppAssets.registerBg,
                  ),
                ),
                Expanded(
                  child: _FormWidget(
                    hasBackground: false,
                  ),
                ),
              ],
            );
          },
        ),
      );
}

class _SmallContent extends StatelessWidget {
  const _SmallContent();

  @override
  Widget build(BuildContext context) => const _FormWidget();
}

class _FormWidget extends StatelessWidget {
  final bool hasBackground;

  const _FormWidget({
    this.hasBackground = true,
  });

  @override
  Widget build(BuildContext context) => BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SuccessSignUpVerifiedState) {
            // context.router.navigate(const LoginRoute());
          } else if (state is SuccessSignUpNotVerifiedState) {
            context.router.navigate(
              ConfirmRoute(
                title: context.appStrings.confirmSignUpTitle,
                message: context.appStrings.confirmSignUpMessage(
                  context.read<SignUpBloc>().emailField?.value,
                ),
                success: true,
              ),
            );
          }
        },
        builder: (context, state) => FormBuilder(
          key: context.read<SignUpBloc>().formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              vertical: 150.0,
              horizontal: 16.0,
            ),
            shrinkWrap: true,
            children: [
              if (state is ErrorSignUpState)
                TwelveErrorCard(
                  errorMessage: switch (state.error) {
                    WrongCredentialException() => context.appStrings.errorWrongPassword,
                    AlreadyExistingAccountException() => context.appStrings.errorAlreadyExsist,
                    _ => context.appStrings.errorGeneric,
                  },
                ),
              if (state is ErrorSignUpState) const SizedBox(height: 24.0),
              EmailField(
                name: SignUpBloc.emailFieldKey,
                disabled: state is SigningUpState,
                onCloseIcon: () => context.read<SignUpBloc>().emailField?.reset(),
                validators: [
                  (val) {
                    final emailConfirm = context.read<SignUpBloc>().emailConfirmField?.value;
                    final email = context.read<SignUpBloc>().emailField?.value;

                    if (emailConfirm != email) {
                      return context.appStrings.registerErrorEmailMatch;
                    }

                    return null;
                  }
                ],
              ),
              const SizedBox(height: 24.0),
              EmailField(
                name: SignUpBloc.emailConfirmFieldKey,
                hintText: context.appStrings.emailConfirmLabel,
                disabled: state is SigningUpState,
                onCloseIcon: () => context.read<SignUpBloc>().emailConfirmField?.reset(),
                validators: [
                  (val) {
                    final emailConfirm = context.read<SignUpBloc>().emailConfirmField?.value;
                    final email = context.read<SignUpBloc>().emailField?.value;

                    if (emailConfirm != email) {
                      return context.appStrings.registerErrorEmailMatch;
                    }

                    return null;
                  }
                ],
              ),
              const SizedBox(height: 24.0),
              PasswordField(
                name: SignUpBloc.passwordFieldKey,
                disabled: state is SigningUpState,
                onCloseIcon: () => context.read<SignUpBloc>().passwordField?.reset(),
                validators: [
                  (val) {
                    final passwordConfirm = context.read<SignUpBloc>().passwordConfirmField?.value;
                    final password = context.read<SignUpBloc>().passwordField?.value;

                    if (passwordConfirm != password) {
                      return context.appStrings.registerErrorPasswordMatch;
                    }

                    return null;
                  }
                ],
              ),
              const SizedBox(height: 24.0),
              PasswordField(
                name: SignUpBloc.passwordConfirmFieldKey,
                hintText: context.appStrings.passwordConfirmLabel,
                disabled: state is SigningUpState,
                onCloseIcon: () => context.read<SignUpBloc>().passwordConfirmField?.reset(),
                validators: [
                  (val) {
                    final passwordConfirm = context.read<SignUpBloc>().passwordConfirmField?.value;
                    final password = context.read<SignUpBloc>().passwordField?.value;

                    if (passwordConfirm != password) {
                      return context.appStrings.registerErrorPasswordMatch;
                    }

                    return null;
                  }
                ],
              ),
              const SizedBox(height: 24.0),
              _SignUpButton(
                disabled: state is SigningUpState,
              ),
            ],
          ),
        ),
      );
}

class _SignUpButton extends StatelessWidget {
  final bool disabled;

  const _SignUpButton({
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: FilledButton(
          onPressed: disabled ? null : () => context.read<SignUpBloc>().onSignUp(),
          child: disabled ? const CircularProgressIndicator() : Text(context.appStrings.ctaSignUp),
        ),
      );
}
