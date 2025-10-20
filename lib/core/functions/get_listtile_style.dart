import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/classes/answer_listtile_style.dart';

AnswerTileStyle getAnswerTileStyle({
  required String correctAnswerKey,
  required String? incorrectAnswerKey,
  required String answerKey,
}) {
  Color tileColor;
  Color iconColor;
  Color borderColor;
  IconData icon;

  if (incorrectAnswerKey == null) {
    if (answerKey == correctAnswerKey) {
      tileColor = AppColors.lightGreen;
      iconColor = AppColors.green;
      borderColor = AppColors.green;
      icon = Icons.radio_button_checked;
    } else {
      tileColor = AppColors.lightBlue;
      iconColor = AppColors.blue;
      borderColor = Colors.transparent;
      icon = Icons.radio_button_off;
    }
  } else {
    if (answerKey == incorrectAnswerKey) {
      tileColor = AppColors.lightRed;
      iconColor = AppColors.red;
      borderColor = AppColors.red;
      icon = Icons.radio_button_checked;
    } else if (answerKey == correctAnswerKey) {
      tileColor = AppColors.lightGreen;
      iconColor = AppColors.blue;
      borderColor = AppColors.green;
      icon = Icons.radio_button_off;
    } else {
      tileColor = AppColors.lightBlue;
      iconColor = AppColors.blue;
      borderColor = Colors.transparent;
      icon = Icons.radio_button_off;
    }
  }

  return AnswerTileStyle(
    tileColor: tileColor,
    iconColor: iconColor,
    borderColor: borderColor,
    icon: icon,
  );
}
