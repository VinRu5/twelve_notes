import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/auth/domain/models/user.dart' as model;
import 'package:twelve_notes/src/data/mappers/mapper.dart';

class UserMapper extends Mapper<model.User, User> {
  @override
  User toDTO(model.User entity) {
    throw UnimplementedError();
  }

  @override
  model.User toModel(User dto) => model.User(
        id: dto.id,
        email: dto.email ?? '',
        phone: dto.phone ?? '',
      );
}
