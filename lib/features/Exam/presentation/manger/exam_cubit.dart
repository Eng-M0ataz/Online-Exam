import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/Exam/data/models/answer/input_answers.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';
import 'package:online_exam/features/Exam/domain/usecases/check_exam_answers_use_case.dart';
import 'package:online_exam/features/Exam/domain/usecases/get_questions_use_case.dart';
import 'package:online_exam/features/Exam/domain/usecases/store_exam_history_localy.dart';
part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetQuestionsUseCase _getQuestionsUseCase;
  final CheckExamAnswersUseCase _checkExamAnswersUseCase;
  final StoreExamHistoryLocalyUseCase _storeExamHistoryLocalyUseCase;
  ExamCubit(
    this._getQuestionsUseCase,
    this._checkExamAnswersUseCase,
    this._storeExamHistoryLocalyUseCase,
  ) : super(ExamState());
  String? currentAnswerKey = '';
  String? questionId = '';
  int pageIndex = 0;
  int currentExamTime = 0;
  List<InputAnswers> listUserAnswers = [];
  final PageController pageController = PageController();
  final ValueNotifier<String> answerNotifier = ValueNotifier('');
  final ValueNotifier<int> questionNumberNotifier = ValueNotifier(1);

  Future<void> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    emit(state.copyWith(isExamLoading: true));
    final result = await _getQuestionsUseCase.invoke(examId: examId);
    switch (result) {
      case ApiSuccessResult<List<QuestionEntity>>():
        emit(
          state.copyWith(
            isExamLoading: false,
            listOfQuestionEntity: result.data,
          ),
        );

      case ApiErrorResult<List<QuestionEntity>>():
        emit(
          state.copyWith(isExamLoading: false, questionFailre: result.failure),
        );
    }
  }

  Future<void> checkAnswers({required String token}) async {
    UserAnswerInputModel inputModel = UserAnswerInputModel(
      answers: listUserAnswers,
      time: currentExamTime,
    );
    emit(state.copyWith(isScoreLoading: true));

    final result = await _checkExamAnswersUseCase.invoke(
      inputModel: inputModel,
      token: token,
    );
    switch (result) {
      case ApiSuccessResult<ScoreEntity>():
        await _storeExamHistoryLocalyUseCase.invoke(
          listOfQuestisonEntity: state.listOfQuestionEntity,
          scoreEntity: result.data,
          userExamDuration: currentExamTime,
        );
        emit(state.copyWith(isScoreLoading: false, scoreEntity: result.data));
      case ApiErrorResult<ScoreEntity>():
        emit(
          state.copyWith(isScoreLoading: false, scoreFailure: result.failure),
        );
    }
  }

  void saveAnswer({required InputAnswers answerModel}) {
    listUserAnswers.add(answerModel);
  }

  void getExamTime(Duration duration) {
    currentExamTime = (duration.inSeconds / 60).round();
  }

  @override
  Future<void> close() async {
    pageController.dispose();
    answerNotifier.dispose();
    questionNumberNotifier.dispose();
    return await super.close();
  }
}
