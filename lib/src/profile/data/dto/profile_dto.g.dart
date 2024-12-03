// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) => ProfileDTO(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      imageBg: json['image_bg'] as String?,
      isAuthor: json['is_author'] as bool? ?? false,
      favouriteSongs: json['favourite_songs'] as Map<String, dynamic>,
      userId: json['user_id'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProfileDTOToJson(ProfileDTO instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      'email': instance.email,
      'username': instance.username,
      if (instance.avatar case final value?) 'avatar': value,
      if (instance.imageBg case final value?) 'image_bg': value,
      'is_author': instance.isAuthor,
      'favourite_songs': instance.favouriteSongs,
      'user_id': instance.userId,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.updatedAt case final value?) 'updated_at': value,
    };
