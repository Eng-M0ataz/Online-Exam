import 'package:hive/hive.dart';
import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
part 'solved_questions_entity.g.dart';

@HiveType(typeId: 1)
class SolvedQuestionEntity extends HiveObject {
  @HiveField(0)
  final String questionId;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String? inCorrectAnswer;
  @HiveField(3)
  final String correctAnswer;
  @HiveField(4)
  final List<Answer> answers;

  SolvedQuestionEntity({
    required this.questionId,
    required this.question,
    this.inCorrectAnswer,
    required this.correctAnswer,
    required this.answers,
  });
}
