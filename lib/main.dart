import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_meneger/cubit/catalog/catalog_cubit.dart';
import 'package:task_meneger/cubit/navigation/cubit.dart';
import 'package:task_meneger/cubit/task/cubit.dart';
import 'package:task_meneger/data/database/app_database.dart';
import 'package:task_meneger/ui/app_navigation.dart';

void main() {
  runApp(const Starter());
}

class Starter extends StatelessWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AppDatabase(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CatalogCubit>(create: (context) => CatalogCubit()),
          BlocProvider<TaskCubit>(create: (context) => TaskCubit()),
          BlocProvider<NavigationCubit>(create: (context)=>NavigationCubit())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppNavigation(),
        ),
      ),
    );
  }
}
