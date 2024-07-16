import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:twelve_notes/src/errors/errors.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/misc/constants.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignInBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: this,
      );

  Color bgCard(BuildContext context) => Theme.of(context).brightness == Brightness.dark
      ? TwelveColors.surfaceLight.withAlpha(220)
      : TwelveColors.surfaceDark.withAlpha(220);

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
            context.appStrings.titleLogin,
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.loginBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            top: false,
            child: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                // TODO: implement listener
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
                    colorCard: bgCard(context),
                    disabled: state is SigningInState,
                    errorState: state is ErrorSignInState ? state : null,
                  ),
                  const SizedBox(height: 60.0),
                  _ResetPassword(
                    disabled: state is SigningInState,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _SignInWithEmailSection extends StatelessWidget {
  final Color colorCard;
  final bool disabled;
  final ErrorSignInState? errorState;

  const _SignInWithEmailSection({
    required this.colorCard,
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Card(
          color: colorCard,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: context.read<SignInBloc>().formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  _EmailField(
                    disabled: disabled,
                    error: error(context),
                  ),
                  _PasswordField(
                    disabled: disabled,
                    error: error(context),
                  ),
                  _LoginButton(
                    disabled: disabled,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _EmailField extends StatelessWidget {
  final bool disabled;
  final String? error;

  const _EmailField({
    this.disabled = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) => FormBuilderTextField(
        name: SignInBloc.emailNameKey,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: context.appStrings.emailLabel,
          errorText: error,
          errorMaxLines: 2,
          prefixIcon: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.solidEnvelope,
                size: 16.0,
                color: TwelveColors.primary,
              ),
            ],
          ),
          suffixIcon: IconButton(
            onPressed: () => context.read<SignInBloc>().emailField?.reset(),
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              size: 16.0,
            ),
          ),
        ),
        enabled: !disabled,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]),
      );
}

class _PasswordField extends StatefulWidget {
  final bool disabled;
  final String? error;

  const _PasswordField({
    this.disabled = false,
    this.error,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: FormBuilderTextField(
          name: SignInBloc.passwordNameKey,
          keyboardType: TextInputType.visiblePassword,
          enabled: !widget.disabled,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: context.appStrings.passwordLabel,
            errorText: widget.error,
            errorMaxLines: 2,
            prefixIcon: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.key,
                  size: 16.0,
                  color: TwelveColors.primary,
                ),
              ],
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => setState(() {
                    obscureText = !obscureText;
                  }),
                  icon: FaIcon(
                    obscureText ? FontAwesomeIcons.solidEye : FontAwesomeIcons.solidEyeSlash,
                    size: 16.0,
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<SignInBloc>().passwordField?.reset(),
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 16.0,
                  ),
                ),
              ],
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(8),
            FormBuilderValidators.match(K.passwordRegEx),
          ]),
        ),
      );
}

class _LoginButton extends StatelessWidget {
  final bool disabled;

  const _LoginButton({
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: FilledButton(
          onPressed: disabled ? null : () => context.read<SignInBloc>().onSignIn(),

          // () {
          //     final SignInBloc signInBloc = context.read<SignInBloc>();
          //     final isValid = signInBloc.formKey.currentState?.saveAndValidate();

          //     if (isValid ?? false) {
          //       signInBloc.signInWithEmail();
          //     }
          //   },
          child: disabled ? const CircularProgressIndicator() : Text(context.appStrings.ctaLogin),
        ),
      );
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
                  onPressed: disabled ? null : () {},
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
