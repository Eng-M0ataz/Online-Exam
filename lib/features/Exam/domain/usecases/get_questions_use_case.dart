import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';

@injectable
class GetQuestionsUseCase {
  final ExamRepo repository;
  GetQuestionsUseCase(this.repository);

  Future<ApiResult<List<QuestionEntity>>> invoke({
    required String examId,
  }) async {
    return await repository.getAllQuestionsOnExam(examId: examId);
  }
}
