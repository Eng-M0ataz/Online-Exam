import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_widget.dart';

class ExamPageView extends StatelessWidget {
  const ExamPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var examCubit = context.read<ExamCubit>();
    return ExpandablePageView.builder(
      onPageChanged: (value) {
        examCubit.answerNotifier.value = '';
        examCubit.questionNumberNotifier.value = value + 1;
        examCubit.currentAnswerKey = '';
        examCubit.pageIndex = value;
      },
      itemCount: examCubit.state.listOfQuestionEntity.length,
      controller: examCubit.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ExamWidget(
        questionEntity: examCubit.state.listOfQuestionEntity[index],
      ),
    );
  }
}
