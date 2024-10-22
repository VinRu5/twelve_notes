import 'package:flutter/material.dart';

class ResetPasswordModal extends StatelessWidget {
  const ResetPasswordModal({super.key});

  @override
  Widget build(BuildContext context) => Container();
  /*
  BlocProvider<ResetPasswordCubit>(
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
      */
}
