import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:talker/talker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // final FirebaseAuth firebaseAuth;
  final Talker talker;

  // late StreamSubscription<User?> _streamSubscription;

  AuthCubit({
    // required this.firebaseAuth,
    required this.talker,
  }) : super(LoadingAuthState()) {
    // _streamSubscription = firebaseAuth.userChanges().listen(_onStateChanged);
  }

  bool get isAuthenticated => state is AuthenticatedState;

  // void _onStateChanged(User? user) {
  //   // In caso di user uguale a null l'utente non è autenticato
  //   if (user == null) {
  //     talker.info('User not logged');

  //     emit(NotAuthicatedState());
  //   } else {
  //     talker.info('user $user logged');

  //     emit(AuthenticatedState(user: user));
  //   }
  // }

  @override
  Future<void> close() async {
    // await _streamSubscription.cancel();
    return super.close();
  }

  // void signOut() => firebaseAuth.signOut();

  // per cancellare l'utente
  // Future<void> deleteUser(User user) async => await user.delete();
}
