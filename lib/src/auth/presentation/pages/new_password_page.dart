import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/new_password_cubit/new_password_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/password_field.dart';
import 'package:twelve_notes/src/misc/app_assets.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

@RoutePage()
class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Scaffold(
          body: BlocProvider<NewPasswordCubit>(
            create: (context) => NewPasswordCubit(
              authenticationRepository: context.read<AuthenticationRepository>(),
            ),
            child: Builder(builder: (context) {
              return Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Image.asset(
                      AppAssets.welcomeImage1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: FormBuilder(
                            key: context.read<NewPasswordCubit>().formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    context.appStrings.newPswTitle,
                                    style: context.twelveStyle?.titleSmall,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 24.0),
                                  child: PasswordField(name: NewPasswordCubit.resetPasswordNameKey),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 24.0),
                                  child: PasswordField(
                                    name: NewPasswordCubit.resetPasswordConfirmNameKey,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: FilledButton(
                                    onPressed: () async {
                                      context.read<NewPasswordCubit>().updatePassword();
                                    },
                                    child: Text(
                                      context.appStrings.confirmCta,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      );
}
