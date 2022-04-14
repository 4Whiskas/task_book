import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_meneger/resources/app_strings.dart';
import 'package:task_meneger/resources/app_text_styles.dart';

import 'data/database/app_database.dart';

class Utils {
  static String dateFormatter(DateTime date) {
    return DateFormat("dd-MM-yy").format(date);
  }

  static List<PopupMenuItem<String>> determineTaskState(NotesTableData note) {
    if (note.state == 'ToDo') {
      return [
        const PopupMenuItem(
          value: AppStrings.startDoingTask,
            child: Text(
          AppStrings.startDoingTask,
          style: AppTextStyles.accentBaseText,
        )),
        const PopupMenuItem(
          value: AppStrings.updateTask,
            child: Text(
          AppStrings.updateTask,
          style: AppTextStyles.accentBaseText,
        )),
        const PopupMenuItem(
          value: AppStrings.deleteTask,
            child: Text(
          AppStrings.deleteTask,
          style: AppTextStyles.accentBaseText,
        ))
      ];
    } else if (note.state == 'Doing') {
      return [
        const PopupMenuItem(
          value: AppStrings.finishTask,
            child: Text(
          AppStrings.finishTask,
          style: AppTextStyles.accentBaseText,
        )),
        const PopupMenuItem(
          value: AppStrings.updateTask,
            child: Text(
          AppStrings.updateTask,
          style: AppTextStyles.accentBaseText,
        )),
        const PopupMenuItem(
          value: AppStrings.deleteTask,
            child: Text(
          AppStrings.deleteTask,
          style: AppTextStyles.accentBaseText,
        ))
      ];
    } else if (note.state == 'Done') {
      return [
        const PopupMenuItem(
            value: AppStrings.deleteTask,
            child: Text(
          AppStrings.deleteTask,
          style: AppTextStyles.accentBaseText,
        ))
      ];
    } else {
      return [
        const PopupMenuItem(
            value: AppStrings.deleteTask,
            child: Text(
          AppStrings.deleteTask,
          style: AppTextStyles.accentBaseText,
        ))
      ];
    }
  }

  static String convertToShort(String long)
  {
    String short = '';

    if(long.split('\n').length>2)
      {
        short = long.split('\n')[0]+'\n'+long.split('\n')[1]+'...';
      }
    else if(long.length>50)
    {
      short = long.substring(0, 50);
      short+='...';
    }
    else{
      short = long;
    }
    return short;
  }

  static String convertToTitle(String long)
  {
    String short = '';

    if(long.length>20)
    {
      short = long.substring(0, 50);
      short+='...';
    }
    else{
      short = long;
    }
    return short;
  }

}
