import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/font_weight.dart';
import 'from_to_text_rich.dart';

class ExamsListViewItem extends StatelessWidget {
  const ExamsListViewItem({super.key, required this.exam});

  final ExamsEntity exam;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exam.title ?? "", style: Theme.of(context).textTheme.displayLarge),
        Container(
          padding: REdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.white2,
            boxShadow: const [
              BoxShadow(color: AppColors.grey, spreadRadius: .3, blurRadius: 3),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.examTest),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    exam.title ?? "",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "${exam.numberOfQuestions.toString()} Question",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                  verticalSpace(5),
                  const FromToTextRich(),
                ],
              ),
              const Spacer(),
              Text(
                "${exam.duration.toString()} Minutes",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
