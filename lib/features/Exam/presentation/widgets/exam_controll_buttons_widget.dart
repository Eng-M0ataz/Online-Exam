import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/Exam/data/models/answer/input_answers.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_exam_button.dart';

class ExamControllWidget extends StatelessWidget {
  const ExamControllWidget({super.key});
  void _saveAnswer(BuildContext context, ExamCubit cubit) {
    context.read<ExamCubit>().saveAnswer(
      answerModel: InputAnswers(
        questionId:
            cubit.state.listOfQuestionEntity[cubit.pageIndex].questionId,
        correct: cubit.currentAnswerKey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ExamCubit>();
    return ValueListenableBuilder(
      valueListenable: cubit.questionNumberNotifier,
      child: CustomExamButton(
        text: AppLocalizations.of(context)!.next,
        onPressed: () {
          if (cubit.currentAnswerKey!.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Please Select An Answer',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
                ),
              ),
            );
          } else {
            _saveAnswer(context, cubit);
            cubit.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        },
        backgroundColor: AppColors.blue,
        borderColor: AppColors.blue,
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: AppColors.white),
      ),
      builder: (context, value, child) {
        if (value == cubit.state.listOfQuestionEntity.length) {
          return CustomExamButton(
            text: AppLocalizations.of(context)!.finish,
            onPressed: () {
              if (cubit.currentAnswerKey!.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Please Select An Answer',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
                    ),
                  ),
                );
              } else {
                _saveAnswer(context, cubit);
                context.pushNamed(AppRoutes.examScoreRoute, arguments: cubit);
              }
            },
            borderColor: AppColors.blue,
            backgroundColor: AppColors.blue,
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.white),
          );
        }
        return child!;
      },
    );
  }
}
