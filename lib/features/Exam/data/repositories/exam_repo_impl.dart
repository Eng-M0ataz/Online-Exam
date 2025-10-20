import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_local_data_source.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_remote_data_source.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _examRemoteDataSource;
  final ExamLocalDataSource _examLocalDataSource;
  ExamRepoImpl(this._examRemoteDataSource, this._examLocalDataSource);
  @override
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String examId,
  }) async {
    ApiResult<List<QuestionEntity>> questions = await _examRemoteDataSource
        .getAllQuestionsOnExam(examId: examId);
    return questions;
  }

  @override
  Future<ApiResult<ScoreEntity>> checkExamAnswers({
    required UserAnswerInputModel inputModel,
  }) {
    return _examRemoteDataSource.checkExamAnswers(inputModel: inputModel);
  }

  @override
  Future<void> storeExamHistoryLocally({
    required List<QuestionEntity> listOfQuestisonEntity,
    required ScoreEntity scoreEntity,
    required int userExamDuration,
  }) async {
    final List<SolvedQuestionEntity> solvedQuestionList = [];
    if (scoreEntity.wrongQuestions != null &&
        scoreEntity.wrongQuestions!.isNotEmpty) {
      solvedQuestionList.addAll(
        buildSolvedQuestions(
          questionEntities: listOfQuestisonEntity,
          solvedQuestions: scoreEntity.wrongQuestions!,
          isWrong: true,
        ),
      );
    }
    if (scoreEntity.correctQuestions != null &&
        scoreEntity.correctQuestions!.isNotEmpty) {
      solvedQuestionList.addAll(
        buildSolvedQuestions(
          questionEntities: listOfQuestisonEntity,
          solvedQuestions: scoreEntity.correctQuestions!,
          isWrong: false,
        ),
      );
    }
    final SolvedExamEntity solvedExamEntity = SolvedExamEntity(
      id: listOfQuestisonEntity[0].exam!.id!,
      numberOfQuestions: listOfQuestisonEntity.length.toString(),
      examDuration: listOfQuestisonEntity[0].exam!.duration.toString(),
      userDuration:
          (listOfQuestisonEntity[0].exam!.duration! - userExamDuration)
              .toString(),
      numberOfCorrectAnswers:
          scoreEntity.correctQuestions?.length.toString() ?? '0',
      questions: solvedQuestionList,
    );

    await _examLocalDataSource.storeExamLocaly(solvedExamEntity);
  }
}

List<SolvedQuestionEntity> buildSolvedQuestions({
  required List<QuestionEntity> questionEntities,
  required List<dynamic> solvedQuestions,
  required bool isWrong,
}) {
  return solvedQuestions.map<SolvedQuestionEntity>((item) {
    final questionEntity = questionEntities.firstWhere(
      (element) => element.questionId == item.qid,
    );

    return SolvedQuestionEntity(
      correctAnswer: item.correctAnswer!,
      inCorrectAnswer: isWrong ? item.inCorrectAnswer! : null,
      question: item.question!,
      questionId: item.qid!,
      answers: questionEntity.answers!,
    );
  }).toList();
}
