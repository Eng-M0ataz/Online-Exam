import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
import 'package:online_exam/features/Exam/data/models/questions/exam.dart';

class QuestionEntity {
  final List<Answer>? answers;
  final String? questionType;
  final String? questionId;
  final String? question;
  final String? correctAnswer;
  final Exam? exam;

  QuestionEntity({
    required this.answers,
    required this.questionType,
    required this.questionId,
    required this.question,
    required this.correctAnswer,
    required this.exam,
  });
}
