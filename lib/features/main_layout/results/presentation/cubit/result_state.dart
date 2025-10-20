part of 'result_cubit.dart';

class ResultState {
  final bool isResultsLoading;
  final List<SolvedExamEntity> listOfSolvedExams;
  final Failure? failure;

  ResultState({
    this.isResultsLoading = true,
    this.listOfSolvedExams = const [],
    this.failure,
  });
  ResultState copyWith({
    bool? isResultsLoading,
    List<SolvedExamEntity>? listOfSolvedExams,
    Failure? failure,
  }) {
    return ResultState(
      isResultsLoading: isResultsLoading ?? this.isResultsLoading,
      listOfSolvedExams: listOfSolvedExams ?? this.listOfSolvedExams,
      failure: failure ?? this.failure,
    );
  }
}
