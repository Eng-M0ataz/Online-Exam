import 'package:hive/hive.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';
part 'solved_exam_entity.g.dart';

@HiveType(typeId: 0)
class SolvedExamEntity extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String numberOfQuestions;
  @HiveField(2)
  final String examDuration;
  @HiveField(3)
  final String userDuration;
  @HiveField(4)
  final String numberOfCorrectAnswers;
  @HiveField(5)
  final List<SolvedQuestionEntity> questions;

  SolvedExamEntity({
    required this.id,
    required this.numberOfQuestions,
    required this.examDuration,
    required this.userDuration,
    required this.numberOfCorrectAnswers,
    required this.questions,
  });
}
