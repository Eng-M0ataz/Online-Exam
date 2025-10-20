import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/main_layout/results/presentation/cubit/result_cubit.dart';
import 'package:online_exam/features/main_layout/results/presentation/widgets/results_list_view.dart';

class ResultScreenBody extends StatefulWidget {
  const ResultScreenBody({super.key});

  @override
  State<ResultScreenBody> createState() => _ResultScreenBodyState();
}

class _ResultScreenBodyState extends State<ResultScreenBody> {
  @override
  void initState() {
    context.read<ResultCubit>().getResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 24.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.results,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          BlocBuilder<ResultCubit, ResultState>(
            builder: (context, state) {
              if (state.isResultsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.listOfSolvedExams.isEmpty) {
                return Center(
                  child: Text(
                    AppLocalizations.of(context)!.you_have_no_results,
                  ),
                );
              }
              return Expanded(
                child: ResultsListView(
                  listOfSolvedExams: state.listOfSolvedExams,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
