import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_meneger/cubit/catalog/catalog_state.dart';
import 'package:task_meneger/data/database/app_database.dart';

import '../../resources/app_strings.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(CatalogLoadingState());
  List<NotesTableData> notesList = [];
  static AppDatabase? appDatabase;
  int currentTable = 0;

  Future<void> init({required BuildContext context}) async {
    appDatabase = await Provider.of<AppDatabase>(context, listen: false);
  }

  Future<void> loadNotes(String state) async {
    emit(CatalogLoadingState());
    try {
      notesList = await appDatabase!.getTypedNotes(state);
      switch (state) {
        case 'ToDo':
          currentTable = 0;
          break;
        case 'Doing':
          currentTable = 1;
          break;
        case 'Done':
          currentTable = 2;
          break;
      }
      if (notesList.isEmpty) {
        emit(CatalogEmptyState());
      } else {
        emit(CatalogLoadedState());
      }
    } catch (_) {
      emit(CatalogErrorState(error: "Ошибка получения данных из базы данных"));
    }
  }

  Future<void> updateNote(
      {required String res,
      required NotesTableData note,
      required BuildContext context}) async {
    emit(CatalogLoadingState());
    try {
      appDatabase = await Provider.of<AppDatabase>(context, listen: false);
      switch (res) {
        case AppStrings.finishTask:
          appDatabase!.updateNote(
              note.id,
              NotesTableCompanion(
                  id: Value(note.id),
                  title: Value(note.title),
                  description: Value(note.description),
                  deadLine: Value(note.deadLine),
                  state: const Value("Done")));
          break;
        case AppStrings.deleteTask:
          appDatabase!.deleteNote(note.id);
          break;
        case AppStrings.startDoingTask:
          appDatabase!.updateNote(
              note.id,
              NotesTableCompanion(
                  id: Value(note.id),
                  title: Value(note.title),
                  description: Value(note.description),
                  deadLine: Value(note.deadLine),
                  state: const Value("Doing")));
          break;
      }
      emit(CatalogLoadedState());
    } catch (_) {
      emit(CatalogErrorState(error: "Ошибка обновления данных"));
    }
  }

  Future<void> updateData()async{
    emit(CatalogLoadingState());
    emit(CatalogLoadedState());
  }
}
