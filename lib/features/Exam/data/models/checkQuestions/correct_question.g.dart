// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectQuestion _$CorrectQuestionFromJson(Map<String, dynamic> json) =>
    CorrectQuestion(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
    );

Map<String, dynamic> _$CorrectQuestionToJson(CorrectQuestion instance) =>
    <String, dynamic>{
      'QID': instance.qid,
      'Question': instance.question,
      'correctAnswer': instance.correctAnswer,
    };
