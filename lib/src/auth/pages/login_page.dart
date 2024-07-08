import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sign_button/sign_button.dart';
import 'package:twelve_notes/src/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/misc/constants.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => SignInBloc(),
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                TwelveColors.bgDark,
                BlendMode.lighten,
              ),
              image: AssetImage(
                'assets/images/login_bg.jpg',
              ),
              opacity: .5,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _HeaderLogin(),
                  FormBuilder(
                    key: context.read<SignInBloc>().formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: const Column(
                      children: [
                        _EmailField(),
                        _PasswordField(),
                        _LoginButton(),
                      ],
                    ),
                  ),
                  const _Divider(),
                  const SizedBox(height: 40.0),
                  const _GoogleAuthButton(),
                  const SizedBox(height: 16.0),
                  const _AppleAuthButton(),
                  const SizedBox(height: 60.0),
                  const _SignUpText(),
                ],
              ),
            ),
          ),
        ),
      );
}

class _HeaderLogin extends StatelessWidget {
  const _HeaderLogin();

  @override
  Widget build(BuildContext context) => Text(
        context.appStrings.titleLogin,
        style: context.twelveStyle?.titleLarge.copyWith(color: TwelveColors.textDark),
      );
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: FormBuilderTextField(
          name: SignInBloc.emailNameKey,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: context.appStrings.emailLabel,
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
              onPressed: () => context
                  .read<SignInBloc>()
                  .formKey
                  .currentState
                  ?.fields[SignInBloc.emailNameKey]
                  ?.reset(),
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
                size: 16.0,
              ),
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.email(),
          ]),
        ),
      );
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

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
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: context.appStrings.passwordLabel,
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
                  onPressed: () => context
                      .read<SignInBloc>()
                      .formKey
                      .currentState
                      ?.fields[SignInBloc.passwordNameKey]
                      ?.reset(),
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
  const _LoginButton();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: FilledButton(
          onPressed: () {
            context.read<SignInBloc>().formKey.currentState?.saveAndValidate();
          },
          child: Text(context.appStrings.ctaLogin),
        ),
      );
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Divider(),
      );
}

class _GoogleAuthButton extends StatelessWidget {
  const _GoogleAuthButton();

  @override
  Widget build(BuildContext context) => SignInButton(
        buttonType: ButtonType.googleDark,
        onPressed: () {},
      );
}

class _AppleAuthButton extends StatelessWidget {
  const _AppleAuthButton();

  @override
  Widget build(BuildContext context) => SignInButton(
        buttonType: ButtonType.appleDark,
        onPressed: () {},
      );
}

class _SignUpText extends StatelessWidget {
  const _SignUpText();

  @override
  Widget build(BuildContext context) => Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.appStrings.signUpText),
            TextButton(
              onPressed: () {},
              child: Text(context.appStrings.signUpCta),
            ),
          ],
        ),
      );
}
