import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:online_exam/features/main_layout/explore/domain/usecases/get_subjects_use_case.dart';

part 'explore_state.dart';

@Injectable()
class ExploreCubit extends Cubit<ExploreState> {
  final GetSubjectsUseCase _getSubjectsUseCase;

  ExploreCubit(this._getSubjectsUseCase) : super(ExploreInitial());

  Future<void> getSubjects() async {
    emit(ExploreLoadingState());
    final result = await _getSubjectsUseCase.invoke();
    switch (result) {
      case ApiSuccessResult<List<SubjectEntity>>():
        emit(
          ExploreSuccessState(
            allSubjects: result.data,
            displayedSubjects: result.data,
          ),
        );
      case ApiErrorResult<List<SubjectEntity>>():
        emit(
          ExploreErrorState(
            errorMessage: result.failure.errorMessage,
            code: result.failure.code,
          ),
        );
    }
  }

  void filterSubjects(String query) {
    final currentState = state;
    if (currentState is ExploreSuccessState) {
      List<SubjectEntity> filteredList;

      if (query.isEmpty) {
        filteredList = currentState.allSubjects;
      } else {
        final lowerCaseQuery = query.toLowerCase();
        filteredList = currentState.allSubjects
            .where(
              (subject) => subject.name!.toLowerCase().contains(lowerCaseQuery),
            )
            .toList();
      }

      emit(currentState.copyWith(displayedSubjects: filteredList));
    }
  }
}
