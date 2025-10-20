import 'package:json_annotation/json_annotation.dart';

part 'exam.g.dart';

@JsonSerializable()
class Exam {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'duration')
  final int? duration;
  @JsonKey(name: 'subject')
  final String? subject;
  @JsonKey(name: 'numberOfQuestions')
  final int? numberOfQuestions;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
