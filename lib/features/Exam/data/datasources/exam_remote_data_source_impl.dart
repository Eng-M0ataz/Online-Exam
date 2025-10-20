import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/core/network/api_services.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_remote_data_source.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/data/models/questions/questions_dto.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ApiServices _apiServices;
  const ExamRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String examId,
  }) async {
    final QuestionsDto questionsDto = await _apiServices.getAllQuestionsOnExam(
      examId,
    );
    try {
      List<QuestionEntity> questions =
          questionsDto.questions
              ?.map((question) => question.toEntity())
              .toList() ??
          [];
      return ApiSuccessResult<List<QuestionEntity>>(data: questions);
    } on DioException catch (e) {
      return ApiErrorResult<List<QuestionEntity>>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<List<QuestionEntity>>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<ScoreEntity>> checkExamAnswers({
    required UserAnswerInputModel inputModel,
  }) async {
    try {
      final response = await _apiServices.checkExamAnswers(inputModel);

      return ApiSuccessResult<ScoreEntity>(data: response.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult<ScoreEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<ScoreEntity>(
        failure: ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
