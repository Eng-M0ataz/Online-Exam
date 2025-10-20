// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileDto _$EditProfileDtoFromJson(Map<String, dynamic> json) =>
    EditProfileDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileDtoToJson(EditProfileDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
