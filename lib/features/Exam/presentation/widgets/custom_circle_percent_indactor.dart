import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCirclePercentIndicator extends StatelessWidget {
  const CustomCirclePercentIndicator({super.key, required this.percent});
  final String percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 66.0,
      lineWidth: 8,
      percent: double.parse(percent.replaceAll('%', '')) / 100,
      center: Text(percent, style: Theme.of(context).textTheme.headlineMedium),
      progressColor: AppColors.blue,
      backgroundColor: AppColors.red,
    );
  }
}
