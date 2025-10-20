import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/subject_exams/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:online_exam/features/subject_exams/presentation/manager/get_exams_state.dart';
import '../../../../core/errors/api_results.dart';
import '../../domain/entities/exams_on_subject_entity.dart';

@injectable
class GetExamsCubit extends Cubit<GetExamsState> {
  final GetExamsOnSubjectUseCase _useCase;

  GetExamsCubit(this._useCase) : super(GetExamsInitialState());

  Future<void> getExams(String subjectId) async {
    emit(GetExamsLoadingState());
    final result = await _useCase.invoke(subjectId);
    switch (result) {
      case ApiSuccessResult<List<ExamsEntity>>():
        emit(GetExamsSuccessState(exams: result.data));
      case ApiErrorResult<List<ExamsEntity>>():
        emit(GetExamsErrorState(errorMessage: result.failure.errorMessage));
    }
  }
}
