import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:twelve_notes/src/auth/domain/repositories/authentication_repository.dart';
import 'package:twelve_notes/src/utils/logger.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository authRepository;

  late StreamSubscription<supabase.AuthState> _authSubscription;

  AuthCubit({
    required this.authRepository,
  }) : super(AuthInitial()) {
    _authSubscription = authRepository.onAuthStateChange.listen(_onStateChanged);
  }

  bool get isAuthenticated => state is AuthenticatedState;

  void _onStateChanged(supabase.AuthState data) {
    final event = data.event;
    final session = data.session;

    talker.debug('event: $event, session: $session');

    if (session != null) {
      emit(AuthenticatedState());
    } else {
      emit(NotAuthicatedState());
    }
  }

  void signOut() => authRepository.signOut();

  @override
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }
}
