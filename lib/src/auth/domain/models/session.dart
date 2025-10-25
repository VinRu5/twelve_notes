import 'package:equatable/equatable.dart';

import 'user.dart';

class Session with EquatableMixin {
  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final User user;

  Session({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
        refreshToken,
        user,
      ];
}
