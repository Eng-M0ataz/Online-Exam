import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';

@injectable
class CheckExamAnswersUseCase {
  final ExamRepo _repository;

  CheckExamAnswersUseCase(this._repository);

  Future<ApiResult<ScoreEntity>> invoke({
    required UserAnswerInputModel inputModel,
    required String token,
  }) async {
    return await _repository.checkExamAnswers(inputModel: inputModel);
  }
}
