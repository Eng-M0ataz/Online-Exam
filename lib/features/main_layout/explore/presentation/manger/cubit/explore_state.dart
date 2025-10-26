part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreSuccessState extends ExploreState {
  final List<SubjectEntity> allSubjects;
  final List<SubjectEntity> displayedSubjects;

  ExploreSuccessState({
    required this.allSubjects,
    required this.displayedSubjects,
  });

  ExploreSuccessState copyWith({
    List<SubjectEntity>? allSubjects,
    List<SubjectEntity>? displayedSubjects,
  }) {
    return ExploreSuccessState(
      allSubjects: allSubjects ?? this.allSubjects,
      displayedSubjects: displayedSubjects ?? this.displayedSubjects,
    );
  }
}

class ExploreErrorState extends ExploreState {
  final String errorMessage;
  final String code;

  ExploreErrorState({required this.errorMessage, required this.code});
}
