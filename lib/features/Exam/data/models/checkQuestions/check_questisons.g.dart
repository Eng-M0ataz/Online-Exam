// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_questisons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestisonsDto _$CheckQuestisonsDtoFromJson(Map<String, dynamic> json) =>
    CheckQuestisonsDto(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckQuestisonsDtoToJson(CheckQuestisonsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'WrongQuestions': instance.wrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };
