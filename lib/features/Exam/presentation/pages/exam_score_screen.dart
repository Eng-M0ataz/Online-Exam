import 'package:flutter/material.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_screen_score_body.dart';

class ExammScoreScreen extends StatelessWidget {
  const ExammScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ExamScreenScoreBody()));
  }
}
