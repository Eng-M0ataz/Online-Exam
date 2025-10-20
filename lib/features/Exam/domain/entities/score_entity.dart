import 'package:online_exam/features/Exam/data/models/checkQuestions/correct_question.dart';
import 'package:online_exam/features/Exam/data/models/checkQuestions/wrong_question.dart';

class ScoreEntity {
  final int? correct;
  final int? incorrect;
  final String? total;
  final List<WrongQuestion>? wrongQuestions;
  final List<CorrectQuestion>? correctQuestions;
  ScoreEntity({
    this.correct,
    this.incorrect,
    this.total,
    required this.wrongQuestions,
    this.correctQuestions,
  });
}
