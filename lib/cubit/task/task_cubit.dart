import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_meneger/cubit/task/cubit.dart';
import 'package:task_meneger/data/database/app_database.dart';

import '../../controllers.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskLoadedState());
  static AppDatabase? appDatabase;

  Future<void> init({required BuildContext context}) async {
    appDatabase = await Provider.of<AppDatabase>(context, listen: false);
  }

  Future<void> createTask(
      {required String title,
      required String description,
      required String state,
      required DateTime deadline,
      required BuildContext context}) async {
    emit(TaskLoadingState());
    appDatabase = await Provider.of<AppDatabase>(context, listen: false);
    appDatabase!.insertNote(NotesTableCompanion(
        title: Value(title),
        description: Value(description),
        state: Value(state),
        deadLine: Value(deadline)));
    emit(TaskCreatedState());
  }

  Future<void> updateTask(
      {required int id,
      required String title,
      required String description,
      required String state,
      required DateTime deadline,
      required BuildContext context}) async {
    emit(TaskLoadingState());
    try{
      appDatabase = await Provider.of<AppDatabase>(context, listen: false);
      appDatabase!.updateNote(
          id,
          NotesTableCompanion(
              title: Value(title),
              description: Value(description),
              state: Value(state),
              deadLine: Value(deadline)));
      clearControllers();
      emit(TaskCreatedState());
    }
    catch(_)
    {
      emit(TaskErrorState(error: "Ошибка записи данных"));
    }
  }

  Future<void> clearControllers() async {
    Controllers.dateController = "Дата";
    Controllers.descriptionCreatingNote.clear();
    Controllers.titleCreatingNote.clear();
  }

  Future<void> dropState() async{
    emit(TaskLoadedState());
  }
}
