import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/classes/answer_listtile_style.dart';
import 'package:online_exam/core/functions/get_listtile_style.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, required this.solvedQuestions});

  final SolvedQuestionEntity solvedQuestions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: solvedQuestions.answers.length,
      separatorBuilder: (context, index) => verticalSpace(16.h),
      itemBuilder: (context, index) {
        final answerKey = solvedQuestions.answers[index];
        final correctAnswerKey = solvedQuestions.correctAnswer;
        final incorrectAnswerKey = solvedQuestions.inCorrectAnswer;
        AnswerTileStyle style = getAnswerTileStyle(
          correctAnswerKey: correctAnswerKey,
          incorrectAnswerKey: incorrectAnswerKey,
          answerKey: answerKey.key!,
        );
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Container(
            decoration: BoxDecoration(
              color: style.tileColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: style.borderColor),
            ),

            child: ListTile(
              leading: Icon(style.icon, color: style.iconColor),
              title: Text(
                solvedQuestions.answers[index].answer!,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: AppColors.blue[90]),
              ),
            ),
          ),
        );
      },
    );
  }
}
