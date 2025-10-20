import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Answer {
  @JsonKey(name: 'answer')
  @HiveField(0)
  final String? answer;
  @JsonKey(name: 'key')
  @HiveField(1)
  final String? key;
  Answer({required this.answer, required this.key});
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
