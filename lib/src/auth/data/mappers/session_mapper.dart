import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twelve_notes/src/auth/data/mappers/user_mapper.dart';
import 'package:twelve_notes/src/auth/domain/models/session.dart' as model;
import 'package:twelve_notes/src/data/mappers/mapper.dart';

class SessionMapper extends Mapper<model.Session, Session> {
  final UserMapper _userMapper;

  SessionMapper({
    required UserMapper userMapper,
  }) : _userMapper = userMapper;

  @override
  Session toDTO(model.Session entity) {
    throw UnimplementedError();
  }

  @override
  model.Session toModel(Session dto) => model.Session(
        tokenType: dto.tokenType,
        accessToken: dto.accessToken,
        refreshToken: dto.accessToken,
        user: _userMapper.toModel(dto.user),
      );
}
