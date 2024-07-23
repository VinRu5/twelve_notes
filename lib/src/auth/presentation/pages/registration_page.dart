import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/email_field.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/name_field.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/password_field.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/router/app_router.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget implements AutoRouteWrapper {
  const RegistrationPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignUpBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
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
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.registerBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            top: false,
            child: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
                if (state is SuccessSignUpState) {
                  context.router.navigate(const LoginRoute());
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
                    NameField(
                      name: SignUpBloc.nameFieldKey,
                      disabled: state is SigningUpState,
                    ),
                    const SizedBox(height: 24.0),
                    NameField(
                      name: SignUpBloc.surnameFieldKey,
                      hintText: context.appStrings.surnameLabel,
                      disabled: state is SigningUpState,
                    ),
                    const SizedBox(height: 24.0),
                    EmailField(
                      name: SignUpBloc.emailFieldKey,
                      disabled: state is SigningUpState,
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
                      validators: [
                        (val) {
                          final passwordConfirm =
                              context.read<SignUpBloc>().passwordConfirmField?.value;
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
                      validators: [
                        (val) {
                          final passwordConfirm =
                              context.read<SignUpBloc>().passwordConfirmField?.value;
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
            ),
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
          child: disabled ? const CircularProgressIndicator() : Text(context.appStrings.ctaLogin),
        ),
      );
}
