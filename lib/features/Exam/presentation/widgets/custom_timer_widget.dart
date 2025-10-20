import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_exam_time_finish_dialog.dart';

class CustomTimerWidget extends StatefulWidget {
  const CustomTimerWidget({super.key});

  @override
  State<CustomTimerWidget> createState() => _CustomTimerWidgetState();
}

class _CustomTimerWidgetState extends State<CustomTimerWidget> {
  late bool isHalfTime;
  late DateTime endTime;
  late int examDuration;
  bool safeKey = false;
  void changeTimerColor(Duration value) {
    if (!safeKey) {
      if (value.inSeconds <= (examDuration * 60) / 2) {
        setState(() {
          isHalfTime = true;
          safeKey = true;
        });
      }
    }
  }

  @override
  void initState() {
    examDuration = context
        .read<ExamCubit>()
        .state
        .listOfQuestionEntity[0]
        .exam!
        .duration!;
    endTime = DateTime.now().add(Duration(minutes: examDuration));

    isHalfTime = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimerCountdown(
          enableDescriptions: false,
          spacerWidth: 0,
          timeTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: isHalfTime ? AppColors.red : AppColors.green,
          ),
          format: CountDownTimerFormat.minutesSeconds,
          endTime: endTime,
          onEnd: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return CustomExamTimeFinishDialog(exameCubitContext: context);
              },
            );
          },
          onTick: (value) {
            changeTimerColor(value);
            context.read<ExamCubit>().getExamTime(value);
          },
        ),
      ],
    );
  }
}
