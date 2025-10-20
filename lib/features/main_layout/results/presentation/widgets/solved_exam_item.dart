import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/utils/app_images.dart';
import 'package:online_exam/core/utils/font_weight.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';

class SolvedExamItem extends StatelessWidget {
  const SolvedExamItem({super.key, required this.solvedExamEntity});
  final SolvedExamEntity solvedExamEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 103.h,
          padding: REdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white2,
            boxShadow: const [
              BoxShadow(color: AppColors.grey, spreadRadius: .3, blurRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset(AppImages.examTest, fit: BoxFit.fill),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "High Level",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "${solvedExamEntity.examDuration} Minutes",
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ],
                    ),
                    Text(
                      "${solvedExamEntity.numberOfQuestions} Question",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${solvedExamEntity.numberOfCorrectAnswers} corrected answer in ${solvedExamEntity.userDuration} minutes.",
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(
                            color: AppColors.blue,
                            fontSize: 12.sp,
                            fontWeight: AppFontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
