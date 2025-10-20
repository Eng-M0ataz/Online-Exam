import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/domain/usecases/get_results_use_case.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  final GetResultsUseCase getResultsUseCase;
  ResultCubit(this.getResultsUseCase) : super(ResultState());

  void getResults() {
    emit(state.copyWith(isResultsLoading: true));
    final List<SolvedExamEntity> result = getResultsUseCase.invoke();
    emit(state.copyWith(isResultsLoading: false, listOfSolvedExams: result));
  }
}
