import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/Exam/data/models/answer/input_answers.dart';
part 'user_answer_input_model.g.dart';

@JsonSerializable()
class UserAnswerInputModel {
  @JsonKey(name: 'answers')
  final List<InputAnswers>? answers;
  @JsonKey(name: 'time')
  final int? time;

  UserAnswerInputModel({this.answers, this.time});
  Map<String, dynamic> toJson() => _$UserAnswerInputModelToJson(this);
}
