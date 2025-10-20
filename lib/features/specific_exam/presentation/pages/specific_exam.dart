import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/utils/app_images.dart';
import 'package:online_exam/core/utils/font_weight.dart';
import 'package:online_exam/core/widgets/custom_arrow_back_icon.dart';
import 'package:online_exam/features/specific_exam/presentation/widgets/instructions_widget.dart';
import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';
import '../../../../config/theme/colors.dart';

class SpecificExamScreen extends StatelessWidget {
  const SpecificExamScreen({super.key, required this.examData});

  final ExamsEntity examData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomArrowBackIcon()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 5.w,
                      children: [
                        Image.asset(AppImages.examTest),
                        Text(
                          'English',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Text(
                      "${examData.duration} ${AppConstants.minutes}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: AppColors.blue),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: examData.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text:
                            "  |  ${examData.numberOfQuestions} ${AppConstants.question}",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: AppFontWeight.regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: .3),
          const Align(
            alignment: Alignment.centerLeft,
            child: InstructionsWidget(),
          ),
          verticalSpace(32),
          Container(
            margin: REdgeInsets.all(16),
            height: 48.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoutes.examRoute, arguments: examData.id);
              },
              child: const Text(AppConstants.start),
            ),
          ),
        ],
      ),
    );
  }
}
