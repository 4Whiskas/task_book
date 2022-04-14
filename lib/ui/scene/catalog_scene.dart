import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_meneger/cubit/catalog/catalog_cubit.dart';
import 'package:task_meneger/cubit/catalog/catalog_state.dart';
import 'package:task_meneger/resources/app_colors.dart';
import 'package:task_meneger/resources/app_strings.dart';
import 'package:task_meneger/resources/app_text_styles.dart';
import 'package:task_meneger/ui/widgets/catalog_app_bar.dart';
import 'package:task_meneger/ui/widgets/task.dart';

import '../widgets/note_add_button.dart';

class CatalogScene extends StatelessWidget {
  const CatalogScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(builder: (context, state) {
      var _cubit = context.read<CatalogCubit>();
      _cubit.init(context: context);
      var screenSize = MediaQuery.of(context).size;
      if (state is CatalogEmptyState) {
        return Scaffold(
          backgroundColor: AppColors.bodyColor,
          appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 40),
            child: const CatalogAppBar(),
          ),
          body: const Center(
              child: Text(
            AppStrings.emptyNotesList,
            style: AppTextStyles.baseText,
          )),
          floatingActionButton: const NoteAddButton(),
        );
      }
      if (state is CatalogLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CatalogLoadedState) {
        return Scaffold(
          backgroundColor: AppColors.bodyColor,
          appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 40),
            child: const CatalogAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenSize.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(_cubit.notesList.length,
                        (index) => Task(note: _cubit.notesList[index]))),
              ),
            ),
          ),
          floatingActionButton: const NoteAddButton(),
        );
      }
      if (state is CatalogErrorState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
