import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';

import '../../../../core/utils/font_weight.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({super.key});
  final List<String> examInstructions = const [
    "⦿ Make sure you have a stable internet connection\n  before starting the exam.",
    "⦿ The exam duration is 30 minutes and will automatically end when time runs out.",
    '⦿ You cannot go back to previous questions after answering.',
    '⦿ Each question has only one correct answer.',
    '⦿ Do not use your phone or any external help during the exam.',
    '⦿ Your answers will be saved automatically after each question.',
    '⦿ You can view your score immediately after finishing the exam.',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Instructions", style: Theme.of(context).textTheme.displayLarge),
          verticalSpace(13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: examInstructions
                .map(
                  (instruction) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      textAlign: TextAlign.start,
                      instruction,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: AppFontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
