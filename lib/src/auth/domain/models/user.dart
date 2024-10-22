import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final String id;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
      ];
}
