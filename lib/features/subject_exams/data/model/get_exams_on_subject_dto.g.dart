// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exams_on_subject_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExamsOnSubjectDto _$GetExamsOnSubjectDtoFromJson(
        Map<String, dynamic> json) =>
    GetExamsOnSubjectDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetExamsOnSubjectDtoToJson(
        GetExamsOnSubjectDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
