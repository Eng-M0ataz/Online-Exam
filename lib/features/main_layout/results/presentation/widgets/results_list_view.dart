import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_exam_entity.dart';
import 'package:online_exam/features/main_layout/results/presentation/widgets/solved_exam_item.dart';

class ResultsListView extends StatelessWidget {
  const ResultsListView({super.key, required this.listOfSolvedExams});
  final List<SolvedExamEntity> listOfSolvedExams;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listOfSolvedExams.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.pushNamed(
            AppRoutes.examAnswerRoute,
            arguments: listOfSolvedExams[index].questions,
          );
        },
        child: SolvedExamItem(solvedExamEntity: listOfSolvedExams[index]),
      ),
      separatorBuilder: (context, index) => verticalSpace(16.h),
    );
  }
}
