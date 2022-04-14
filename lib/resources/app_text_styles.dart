import 'package:flutter/material.dart';
import 'package:task_meneger/resources/app_colors.dart';

class AppTextStyles {
  static const TextStyle headerText = TextStyle(
      color: AppColors.primaryTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const TextStyle accentHeaderText = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const TextStyle baseText = TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle accentBaseText = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400);
}
