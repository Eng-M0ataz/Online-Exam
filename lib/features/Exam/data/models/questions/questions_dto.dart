import 'package:json_annotation/json_annotation.dart';
import 'question.dart';
part 'questions_dto.g.dart';

@JsonSerializable()
class QuestionsDto {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'questions')
  final List<Question>? questions;

  QuestionsDto({this.message, this.questions});

  factory QuestionsDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsDtoToJson(this);
}
