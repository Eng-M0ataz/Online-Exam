import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';

class ExamAnswerRadioListTileWidget extends StatelessWidget {
  const ExamAnswerRadioListTileWidget({super.key, required this.answers});
  final Answer answers;
  @override
  Widget build(BuildContext context) {
    final examCubit = context.read<ExamCubit>();
    return ValueListenableBuilder<String>(
      valueListenable: examCubit.answerNotifier,
      builder: (context, groubValue, child) {
        return Container(
          decoration: BoxDecoration(
            color: groubValue == answers.answer
                ? AppColors.blue[10]
                : AppColors.lightBlue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: RadioListTile(
            radioScaleFactor: 1.2,
            activeColor: AppColors.blue,
            value: answers.answer,
            groupValue: groubValue,
            onChanged: (value) {
              examCubit.answerNotifier.value = value!;
              examCubit.currentAnswerKey = answers.key!;
            },
            title: Text(answers.answer!),
          ),
        );
      },
    );
  }
}
