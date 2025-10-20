import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';
import 'package:online_exam/features/main_layout/results/presentation/widgets/custom_listtile.dart';

class ResultAnswersScreenBody extends StatelessWidget {
  const ResultAnswersScreenBody({
    super.key,
    required this.listOfSolvedQuestions,
  });
  final List<SolvedQuestionEntity> listOfSolvedQuestions;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomBackButton(title: AppLocalizations.of(context)!.answers),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: listOfSolvedQuestions.length,
            padding: EdgeInsets.all(16.w),
            separatorBuilder: (context, index) => verticalSpace(16.h),

            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: const [
                  BoxShadow(color: AppColors.grey, blurRadius: 3),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.h,
                children: [
                  Text(
                    listOfSolvedQuestions[index].question,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  CustomListtile(solvedQuestions: listOfSolvedQuestions[index]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
