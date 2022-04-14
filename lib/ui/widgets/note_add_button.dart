import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/navigation/navigation_cubit.dart';
import '../../cubit/task/task_cubit.dart';
import '../../resources/app_colors.dart';

class NoteAddButton extends StatelessWidget {
  const NoteAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: AppColors.bodyColor,
        elevation: 0,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: AppColors.accentColor, width: 2)),
          child: const Icon(
            Icons.add,
            color: AppColors.accentColor,
            size: 30,
          ),
        ),
        onPressed: () {
          context.read<TaskCubit>().dropState();
          context.read<NavigationCubit>().pushToTaskScene(null);
        });
  }
}