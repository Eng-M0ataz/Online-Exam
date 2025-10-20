// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDataDto _$GetUserDataDtoFromJson(Map<String, dynamic> json) =>
    GetUserDataDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserInfoDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDataDtoToJson(GetUserDataDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
