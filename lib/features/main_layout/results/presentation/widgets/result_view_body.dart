import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/utils/font_weight.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24.h,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            AppLocalizations.of(context)!.results,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Expanded(
          child: BlocBuilder<ResultCubit, ResultState>(
            builder: (context, state) {
              if (state.isResultsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.listOfSolvedExams.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/no_data.svg',
                        height: 200.h,
                        width: 200.w,
                      ),
                      verticalSpace(10),
                      Text(
                        'Sorry No Data Found',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: AppFontWeight.medium,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ResultsListView(
                listOfSolvedExams: state.listOfSolvedExams,
              );
            },
          ),
        ),
      ],
    );
  }
}
