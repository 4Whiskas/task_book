import 'package:bloc/bloc.dart';
import 'package:task_meneger/cubit/navigation/cubit.dart';
import 'package:task_meneger/data/database/app_database.dart';

class NavigationCubit extends Cubit<NavigationState>{
  NavigationCubit() : super(NavigationCatalogState());

  void pushToCatalogScene() => emit(NavigationCatalogState());

  void pushToTaskScene(NotesTableData? note) => emit(NavigationTaskState(note: note));

}
