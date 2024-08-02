import 'package:firebase_auth/firebase_auth.dart';

extension UserFirstLastName on User {
  String get firstName {
    if (displayName == null || displayName!.isNotEmpty) {
      return '';
    }

    final split = displayName!.split(' ');
    if (split.isEmpty) {
      return '';
    }

    return split.first;
  }

  String get lastName {
    if (displayName == null || displayName!.isNotEmpty) {
      return '';
    }

    final split = displayName!.split(' ');
    if (split.length <= 1) {
      return '';
    }

    return split.last;
  }
}
