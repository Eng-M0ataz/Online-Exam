import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/functions/format_percentage.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/network/api_constants.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_circle_percent_indactor.dart';
import 'package:online_exam/features/Exam/presentation/widgets/user_answers_info.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:online_exam/features/main_layout/main_layout.dart';

class ExamScreenScoreBody extends StatefulWidget {
  const ExamScreenScoreBody({super.key});

  @override
  State<ExamScreenScoreBody> createState() => _ExamScreenScoreBodyState();
}

class _ExamScreenScoreBodyState extends State<ExamScreenScoreBody> {
  @override
  void initState() {
    context.read<ExamCubit>().checkAnswers(
      token: SharedPrefHelper.getData(key: ApiConstants.token) as String,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        if (state.isScoreLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.scoreFailure != null) {
          return Center(child: Text(state.scoreFailure!.errorMessage));
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(title: AppLocalizations.of(context)!.exam_score),
              verticalSpace(40),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomCirclePercentIndicator(
                      percent: formatPercentage(state.scoreEntity!.total!),
                    ),
                  ),
                  horizontalSpace(24),
                  Expanded(
                    flex: 2,
                    child: UserAnswersInfoWidget(
                      correctNumber: state.scoreEntity!.correct!,
                      incorrectNumber: state.scoreEntity!.incorrect!,
                    ),
                  ),
                ],
              ),
              verticalSpace(80),
              SizedBox(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainLayout(initiaIndex: 1),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.show_result,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColors.white),
                  ),
                ),
              ),
              verticalSpace(24),
              SizedBox(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    side: const BorderSide(color: AppColors.blue, width: 1),
                  ),
                  onPressed: () {
                    context.read<ExamCubit>().close();
                    context.pushReplacementNamed(AppRoutes.examRoute);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.start_again,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
