import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: FilledButton(
          onPressed: () => context.read<AuthCubit>().signOut(),
          child: Text('logOUt'),
        ),
      );
}
