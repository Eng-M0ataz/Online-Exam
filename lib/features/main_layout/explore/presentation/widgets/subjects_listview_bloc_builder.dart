import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dummy/subject_list.dart';
import 'package:online_exam/features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart';
import 'package:online_exam/features/main_layout/explore/presentation/widgets/subjects_listview.dart';

class SubjectsListViewBlocBuilder extends StatelessWidget {
  const SubjectsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreSuccessState) {
          return SubjectsListView(isLoading: false, subjects: state.subjects);
        }
        if (state is ExploreErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        return SubjectsListView(isLoading: true, subjects: subjects);
      },
    );
  }
}
