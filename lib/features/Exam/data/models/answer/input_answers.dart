import 'package:json_annotation/json_annotation.dart';
part 'input_answers.g.dart';

@JsonSerializable()
class InputAnswers {
  @JsonKey(name: 'questionId')
  final String? questionId;
  @JsonKey(name: 'correct')
  final String? correct;

  InputAnswers({this.questionId, this.correct});

  Map<String, dynamic> toJson() => _$InputAnswersToJson(this);
}
