import 'package:flutter/material.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_screen_body.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key, required this.examId});
  final String examId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ExamScreenBody(examId: examId)),
    );
  }
}
