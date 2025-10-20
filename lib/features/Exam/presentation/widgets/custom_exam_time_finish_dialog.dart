import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';

class CustomExamTimeFinishDialog extends StatelessWidget {
  const CustomExamTimeFinishDialog({
    super.key,
    required this.exameCubitContext,
  });
  final BuildContext exameCubitContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        AppLocalizations.of(context)!.time_out,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: 24.sp,
          color: AppColors.red,
        ),
      ),
      actions: [
        Center(
          child: SizedBox(
            height: 40.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.examScoreRoute,
                  arguments: exameCubitContext.read<ExamCubit>(),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.view_score,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
