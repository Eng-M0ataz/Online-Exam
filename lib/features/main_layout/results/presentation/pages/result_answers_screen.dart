import 'package:flutter/material.dart';
import 'package:online_exam/features/main_layout/results/domain/entities/solved_questions_entity.dart';
import 'package:online_exam/features/main_layout/results/presentation/widgets/answers_screen_body.dart';

class ResultAnswersScreen extends StatelessWidget {
  const ResultAnswersScreen({super.key, required this.solvedExamEntity});
  final List<SolvedQuestionEntity> solvedExamEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResultAnswersScreenBody(listOfSolvedQuestions: solvedExamEntity),
      ),
    );
  }
}
