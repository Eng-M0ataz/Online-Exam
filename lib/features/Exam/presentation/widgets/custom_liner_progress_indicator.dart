import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';

class CustomLinerProgressIndicator extends StatelessWidget {
  const CustomLinerProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    int questionsLength = context
        .read<ExamCubit>()
        .state
        .listOfQuestionEntity
        .length;
    return ValueListenableBuilder<int>(
      valueListenable: context.read<ExamCubit>().questionNumberNotifier,
      builder: (context, value, child) => Column(
        children: [
          Text(
            '${AppLocalizations.of(context)!.question} $value  ${AppLocalizations.of(context)!.of_} $questionsLength',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          verticalSpace(2),
          SizedBox(
            height: 4.h,
            child: LinearProgressIndicator(
              value: value / questionsLength,
              backgroundColor: AppColors.black[10],
              color: AppColors.blue,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
