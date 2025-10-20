part of 'exam_cubit.dart';

class ExamState {
  final bool isExamLoading;
  final List<QuestionEntity> listOfQuestionEntity;
  final Failure? questionFailre;

  final bool isScoreLoading;
  final ScoreEntity? scoreEntity;
  final Failure? scoreFailure;

  ExamState({
    this.isExamLoading = true,
    this.listOfQuestionEntity = const [],
    this.questionFailre,
    this.isScoreLoading = false,
    this.scoreEntity,
    this.scoreFailure,
  });
  ExamState copyWith({
    bool? isExamLoading,
    List<QuestionEntity>? listOfQuestionEntity,
    Failure? questionFailre,
    bool? isScoreLoading,
    ScoreEntity? scoreEntity,
    Failure? scoreFailure,
  }) {
    return ExamState(
      isExamLoading: isExamLoading ?? this.isExamLoading,
      listOfQuestionEntity: listOfQuestionEntity ?? this.listOfQuestionEntity,
      questionFailre: questionFailre ?? this.questionFailre,
      isScoreLoading: isScoreLoading ?? this.isScoreLoading,
      scoreEntity: scoreEntity ?? this.scoreEntity,
      scoreFailure: scoreFailure ?? this.scoreFailure,
    );
  }
}
