import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_meneger/cubit/catalog/catalog_cubit.dart';
import 'package:task_meneger/cubit/navigation/cubit.dart';
import 'package:task_meneger/ui/scene/catalog_scene.dart';
import 'package:task_meneger/ui/scene/task_scene.dart';

class AppNavigation extends StatelessWidget{
  const AppNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if(state is NavigationCatalogState)
          {
            context.read<CatalogCubit>().loadNotes(state: 'ToDo', context: context);
          }
        return Navigator(
          pages: [
            if(state is NavigationCatalogState) const MaterialPage(child: CatalogScene()),
            if(state is NavigationTaskState) MaterialPage(child: TaskScene(note: state.note,))
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      }
    );
  }
  
}