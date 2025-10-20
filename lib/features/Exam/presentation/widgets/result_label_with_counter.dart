import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';

class ResultLabelWithCounter extends StatelessWidget {
  const ResultLabelWithCounter({
    super.key,
    required this.answersNumber,
    required this.text,
    required this.textStyle,
  });

  final int answersNumber;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: textStyle),
          CircleAvatar(
            radius: 16.5.r,
            backgroundColor: AppColors.blue,
            child: CircleAvatar(
              radius: 14.5.r,
              backgroundColor: AppColors.white,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  answersNumber.toString(),
                  style: const TextStyle(color: AppColors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
