import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class ProfileDTO with EquatableMixin {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String username;
  final String? avatar;
  final String? imageBg;
  final bool isAuthor;
  final Map<String, dynamic> favouriteSongs;
  final String userId;
  final String? createdAt;
  final String? updatedAt;

  ProfileDTO({
    this.id,
    this.firstName,
    this.lastName,
    required this.email,
    required this.username,
    this.avatar,
    this.imageBg,
    this.isAuthor = false,
    required this.favouriteSongs,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileDTO.fromJSON(Map<String, dynamic> map) => _$ProfileDTOFromJson(map);
  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);

  factory ProfileDTO.initialProfile({
    required String email,
    required String userId,
    required String username,
  }) =>
      ProfileDTO(
        email: email,
        username: username,
        favouriteSongs: {},
        userId: userId,
      );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        username,
        avatar,
        imageBg,
        isAuthor,
        favouriteSongs,
        userId,
        createdAt,
        updatedAt,
      ];
}
