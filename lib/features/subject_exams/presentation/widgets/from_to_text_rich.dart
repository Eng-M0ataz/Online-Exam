import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/utils/font_weight.dart';

class FromToTextRich extends StatelessWidget {
  const FromToTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "From: ",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
          ),
          TextSpan(
            text: "1.00   ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: AppFontWeight.medium,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: "To: ",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
          ),
          TextSpan(
            text: "6.00",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: AppFontWeight.medium,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
