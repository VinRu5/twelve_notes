import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twelve_notes/src/auth/data/adapters/user_adapter.dart';
import 'package:twelve_notes/src/auth/domain/models/user.dart';
import 'package:twelve_notes/src/misc/constants.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final UserAdapter _userAdapter;

  UserRepository({
    required FirebaseFirestore firebaseFirestore,
    required UserAdapter userAdapter,
  })  : _firebaseFirestore = firebaseFirestore,
        _userAdapter = userAdapter;

  Future<void> create(User user) async {
    _firebaseFirestore.collection(K.usersFKey).doc(user.id).set(
          _userAdapter.toFirebase(user),
        );
  }
}
