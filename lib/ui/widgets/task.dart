import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_meneger/cubit/catalog/catalog_cubit.dart';
import 'package:task_meneger/cubit/navigation/cubit.dart';
import 'package:task_meneger/data/database/app_database.dart';
import 'package:task_meneger/resources/app_colors.dart';
import 'package:task_meneger/resources/app_strings.dart';
import 'package:task_meneger/resources/app_text_styles.dart';

import '../../cubit/task/task_cubit.dart';
import '../../utils.dart';
import 'bottom_task_view.dart';

class Task extends StatelessWidget {
  const Task({Key? key, required this.note}) : super(key: key);

  final NotesTableData note;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    Color cardColor = AppColors.baseCardColor;
    String noteDate = DateFormat('dd-MM-yy').format(note.deadLine);
    String todayDate = DateFormat('dd-MM-yy').format(DateTime.now());
    if (noteDate == todayDate) {
      cardColor = AppColors.todayCardColor;
    } else if (note.deadLine.isBefore(DateTime.now())) {
      cardColor = AppColors.deadCardColor;
    }
    return PopupMenuButton(
      color: AppColors.accentColor,
      onSelected: (result) {
        context.read<TaskCubit>().dropState();
        if (result.toString().isEmpty || result == null) {
          return;
        }
        else{
          if (result == AppStrings.updateTask) {
            context.read<NavigationCubit>().pushToTaskScene(note);
          }
          if (result == AppStrings.startDoingTask ||
              result == AppStrings.deleteTask ||
              result == AppStrings.finishTask) {
            context
                .read<CatalogCubit>()
                .updateNote(res: result.toString(), note: note, context: context);
            context.read<NavigationCubit>().pushToCatalogScene();
          }
        }

      },
      itemBuilder: (BuildContext context) => Utils.determineTaskState(note),
      child: GestureDetector(
        onLongPress: () {
          showBottomSheet(
              context: context,
              builder: (context) {
                return BottomTaskView(
                  note: note,
                );
              });
        },
        child: Card(
          color: cardColor,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 100,
            width: _screenSize.width - 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      Utils.convertToTitle(note.title),
                      style: AppTextStyles.headerText,
                    ),
                    Text(
                      Utils.dateFormatter(note.deadLine),
                      style: AppTextStyles.baseText,
                    ),
                  ],
                ),
                const SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      Utils.convertToShort(note.description),
                      style: AppTextStyles.baseText,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
