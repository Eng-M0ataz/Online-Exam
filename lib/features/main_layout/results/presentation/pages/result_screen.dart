import 'package:flutter/material.dart';
import 'package:online_exam/features/main_layout/results/presentation/widgets/result_view_body.dart';

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: ResultScreenBody());
  }
}
