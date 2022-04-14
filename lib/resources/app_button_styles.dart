import 'package:flutter/material.dart';
import 'package:task_meneger/resources/app_colors.dart';

class AppButtonStyles {
  static ButtonStyle headerButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor: MaterialStateProperty.all(AppColors.accentColor),
      shadowColor: MaterialStateProperty.all(Colors.transparent));

  static ButtonStyle accentHeaderButton = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.accentColor),
      foregroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor: MaterialStateProperty.all(AppColors.accentColor),
      shadowColor: MaterialStateProperty.all(Colors.transparent));
}
