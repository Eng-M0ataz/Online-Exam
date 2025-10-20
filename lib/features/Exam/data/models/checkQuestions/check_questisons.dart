import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';

import 'correct_question.dart';
import 'wrong_question.dart';

part 'check_questisons.g.dart';

@JsonSerializable()
class CheckQuestisonsDto {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'correct')
  int? correct;
  @JsonKey(name: 'wrong')
  int? wrong;
  @JsonKey(name: 'total')
  String? total;
  @JsonKey(name: 'WrongQuestions')
  List<WrongQuestion>? wrongQuestions;
  @JsonKey(name: 'correctQuestions')
  List<CorrectQuestion>? correctQuestions;

  CheckQuestisonsDto({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckQuestisonsDto.fromJson(Map<String, dynamic> json) =>
      _$CheckQuestisonsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckQuestisonsDtoToJson(this);

  ScoreEntity toEntity() => ScoreEntity(
    correct: correct ?? 0,
    incorrect: wrong ?? 0,
    total: total ?? '0',
    wrongQuestions: wrongQuestions ?? [],
    correctQuestions: correctQuestions ?? [],
  );
}
