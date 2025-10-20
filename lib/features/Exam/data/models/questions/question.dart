import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'answer.dart';
import 'exam.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  @JsonKey(name: 'answers')
  final List<Answer>? answers;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'correct')
  final String? correct;
  @JsonKey(name: 'subject')
  final dynamic subject;
  @JsonKey(name: 'exam')
  final Exam? exam;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionEntity toEntity() => QuestionEntity(
    answers: answers,
    correctAnswer: correct,
    exam: exam,
    question: question,
    questionId: id,
    questionType: type,
  );
}
