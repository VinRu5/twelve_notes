import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/auth/data/mappers/session_mapper.dart';
import 'package:twelve_notes/src/auth/data/mappers/user_mapper.dart';
import 'package:twelve_notes/src/auth/data/services/authentication_service.dart';
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/auth/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:twelve_notes/src/profile/data/services/profile_service.dart';

part 'blocs.dart';
part 'repositories.dart';
part 'services.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Provider<SupabaseClient>(
        create: (_) => Supabase.instance.client,
        child: MultiProvider(
          providers: services,
          child: MultiRepositoryProvider(
            providers: repositories,
            child: MultiBlocProvider(
              providers: blocs,
              child: child,
            ),
          ),
        ),
      );
}
