import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_answer_radio_listtile_widget.dart';

class ExamWidget extends StatelessWidget {
  const ExamWidget({super.key, required this.questionEntity});

  final QuestionEntity questionEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionEntity.question!,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(24.h),
        ListView.separated(
          separatorBuilder: (context, index) => verticalSpace(16.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questionEntity.answers!.length,
          itemBuilder: (context, index) {
            return ExamAnswerRadioListTileWidget(
              answers: questionEntity.answers![index],
            );
          },
        ),
      ],
    );
  }
}
