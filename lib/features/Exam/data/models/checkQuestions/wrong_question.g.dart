// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrong_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrongQuestion _$WrongQuestionFromJson(Map<String, dynamic> json) =>
    WrongQuestion(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
    );

Map<String, dynamic> _$WrongQuestionToJson(WrongQuestion instance) =>
    <String, dynamic>{
      'QID': instance.qid,
      'Question': instance.question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
    };
