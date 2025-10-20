import 'package:json_annotation/json_annotation.dart';

part 'wrong_question.g.dart';

@JsonSerializable()
class WrongQuestion {
  @JsonKey(name: 'QID')
  String? qid;
  @JsonKey(name: 'Question')
  String? question;
  @JsonKey(name: 'inCorrectAnswer')
  String? inCorrectAnswer;
  @JsonKey(name: 'correctAnswer')
  String? correctAnswer;

  WrongQuestion({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
  });

  factory WrongQuestion.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$WrongQuestionToJson(this);
}
