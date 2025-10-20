import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/Exam/presentation/widgets/result_label_with_counter.dart';

class UserAnswersInfoWidget extends StatelessWidget {
  const UserAnswersInfoWidget({
    super.key,
    required this.correctNumber,
    required this.incorrectNumber,
  });
  final int correctNumber, incorrectNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultLabelWithCounter(
          answersNumber: correctNumber,
          text: AppLocalizations.of(context)!.correct,
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
        ),
        verticalSpace(8),
        ResultLabelWithCounter(
          answersNumber: incorrectNumber,
          text: AppLocalizations.of(context)!.incorrect,
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: AppColors.red),
        ),
      ],
    );
  }
}
