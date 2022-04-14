import 'package:task_meneger/data/database/app_database.dart';

abstract class NavigationState{}

class NavigationCatalogState extends NavigationState{}

class NavigationTaskState extends NavigationState{
  NotesTableData? note;
  NavigationTaskState({this.note});
}