import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/network/api_constants.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_liner_progress_indicator.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_app_bar.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_controll_buttons_widget.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_page_view.dart';

class ExamScreenBody extends StatefulWidget {
  const ExamScreenBody({super.key, required this.examId});
  final String examId;
  @override
  State<ExamScreenBody> createState() => _ExamScreenBodyState();
}

class _ExamScreenBodyState extends State<ExamScreenBody> {
  @override
  void initState() {
    context.read<ExamCubit>().getAllQuestionsOnExam(
      token: SharedPrefHelper.getData(key: ApiConstants.token) as String,
      examId: widget.examId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          if (state.questionFailre != null) {
            return Center(
              child: Text(
                '${state.questionFailre!.errorMessage} with code ${state.questionFailre!.code}',
              ),
            );
          }
          if (state.isExamLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const ExamAppBar(),
              verticalSpace(22.h),
              const CustomLinerProgressIndicator(),
              verticalSpace(29.h),
              const ExamPageView(),
              verticalSpace(80.h),
              const ExamControllWidget(),
              verticalSpace(20.h),
            ],
          );
        },
      ),
    );
  }
}
