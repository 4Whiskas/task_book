import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_meneger/cubit/navigation/cubit.dart';
import 'package:task_meneger/cubit/task/cubit.dart';
import 'package:task_meneger/data/database/app_database.dart';
import 'package:task_meneger/resources/app_colors.dart';
import 'package:task_meneger/resources/app_strings.dart';
import 'package:task_meneger/resources/app_text_styles.dart';

import '../../controllers.dart';
import '../../utils.dart';

class TaskScene extends StatelessWidget {
  const TaskScene({Key? key, this.note}) : super(key: key);

  final NotesTableData? note;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
      var _cubit = context.read<TaskCubit>();
      _cubit.init(context: context);
      DateTime _savedDate = DateTime.now();
      if (state is TaskLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is TaskLoadedState) {
        if (note != null) {
          Controllers.dateController = Utils.dateFormatter(note!.deadLine);
          Controllers.titleCreatingNote.text = note!.title;
          Controllers.descriptionCreatingNote.text = note!.description;
        }
        return Scaffold(
          backgroundColor: AppColors.bodyColor,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {
                  _cubit.clearControllers();
                  context.read<NavigationCubit>().pushToCatalogScene();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.accentColor,
                )),
            title: Text(note == null ? AppStrings.newNote : note!.title),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    if (note == null) {
                      context.read<TaskCubit>().createTask(
                          title: Controllers.titleCreatingNote.text,
                          description: Controllers.descriptionCreatingNote.text,
                          state: "ToDo",
                          deadline: _savedDate,
                          context: context);
                    } else {
                      context.read<TaskCubit>().updateTask(
                          title: Controllers.titleCreatingNote.text,
                          description: Controllers.descriptionCreatingNote.text,
                          state: note!.state,
                          deadline: _savedDate,
                          context: context,
                          id: note!.id);
                    }
                  },
                  icon: const Icon(
                    Icons.done,
                    color: AppColors.accentColor,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              color: AppColors.bodyColor,
              child: Column(
                children: [
                  TextField(
                    controller: Controllers.titleCreatingNote,
                    style: AppTextStyles.baseText,
                    maxLength: 20,
                    decoration: InputDecoration(
                      label: const Text(
                        AppStrings.title,
                        style: AppTextStyles.baseText,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: AppColors.borderColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: TextField(
                      controller: Controllers.descriptionCreatingNote,
                      style: AppTextStyles.baseText,
                      textAlign: TextAlign.start,
                      maxLines: 15,
                      decoration: InputDecoration(
                        label: const Text(
                          AppStrings.description,
                          style: AppTextStyles.baseText,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: AppColors.borderColor)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        AppStrings.deadline,
                        style: AppTextStyles.baseText.copyWith(fontSize: 25),
                      ),
                      StatefulBuilder(builder: (context, setState) {
                        return GestureDetector(
                          onTap: () async {
                            var dat = await showDatePicker(
                                context: context,
                                locale: const Locale("ru", "RU"),
                                initialDate: DateTime.now(),
                                firstDate: DateTime.utc(2022),
                                lastDate: DateTime.utc(2040),
                                builder: (context, child) {
                                  return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark().copyWith(
                                          primary: AppColors.accentColor
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary: AppColors.accentColor,
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: child!);
                                });
                            setState(() {
                              _savedDate = dat!;
                              Controllers.dateController =
                                  Utils.dateFormatter(_savedDate);
                            });
                          },
                          child: Text(
                            Controllers.dateController,
                            style: AppTextStyles.baseText.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 25),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if (state is TaskErrorState) {
        return Center(
          child: Container(child: const Text(AppStrings.error)),
        );
      }
      if (state is TaskCreatedState) {
        _cubit.clearControllers();
        context.read<NavigationCubit>().pushToCatalogScene();
      }

      return const SizedBox.shrink();
    });
  }
}
