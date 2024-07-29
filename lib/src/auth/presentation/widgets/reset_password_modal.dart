import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/reset_password_cubit/reset_password_cubit.dart';
import 'package:twelve_notes/src/auth/presentation/widgets/email_field.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';

class ResetPasswordModal extends StatelessWidget {
  const ResetPasswordModal({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<ResetPasswordCubit>(
        create: (context) => ResetPasswordCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: FormBuilder(
                      key: context.read<ResetPasswordCubit>().formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              iconSize: 18.0,
                              onPressed: () => context.router.maybePop(),
                              icon: const FaIcon(
                                FontAwesomeIcons.xmark,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              context.appStrings.resetPswModalMessage,
                              style: context.twelveStyle?.titleSmall,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: EmailField(
                              name: ResetPasswordCubit.resetEmailNameKey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: FilledButton(
                              onPressed: () async {
                                context
                                    .read<ResetPasswordCubit>()
                                    .sendResetPassword()
                                    .then((value) {
                                  if (value) {
                                    context.router.maybePop();
                                  }
                                });
                              },
                              child: Text(
                                context.appStrings.resetPswModalCta,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
}
