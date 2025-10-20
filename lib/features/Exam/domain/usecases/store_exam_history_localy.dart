import 'package:injectable/injectable.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';

@injectable
class StoreExamHistoryLocalyUseCase {
  final ExamRepo _repository;
  StoreExamHistoryLocalyUseCase(this._repository);

  Future<void> invoke({
    required List<QuestionEntity> listOfQuestisonEntity,
    required ScoreEntity scoreEntity,
    required int userExamDuration,
  }) async {
    return await _repository.storeExamHistoryLocally(
      listOfQuestisonEntity: listOfQuestisonEntity,
      scoreEntity: scoreEntity,
      userExamDuration: userExamDuration,
    );
  }
}
