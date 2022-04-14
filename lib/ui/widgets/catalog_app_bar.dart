import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_meneger/cubit/catalog/catalog_cubit.dart';
import 'package:task_meneger/resources/app_button_styles.dart';
import 'package:task_meneger/resources/app_text_styles.dart';

import '../../resources/app_strings.dart';

class CatalogAppBar extends StatefulWidget {
  const CatalogAppBar({Key? key}) : super(key: key);

  @override
  State<CatalogAppBar> createState() => _CatalogAppBarState();
}

class _CatalogAppBarState extends State<CatalogAppBar> {
  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<CatalogCubit>();
    var _screenSize = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  _cubit.loadNotes("ToDo");
                });
              },
              style: _cubit.currentTable == 0
                  ? AppButtonStyles.accentHeaderButton
                  : AppButtonStyles.headerButton,
              child: SizedBox(
                width: (_screenSize.width - 50) / 3,
                child: Text(
                  AppStrings.toDo,
                  textAlign: TextAlign.center,
                  style: _cubit.currentTable == 0
                      ? AppTextStyles.accentHeaderText
                      : AppTextStyles.headerText,
                ),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _cubit.loadNotes("Doing");
                });
              },
              style: _cubit.currentTable == 1
                  ? AppButtonStyles.accentHeaderButton
                  : AppButtonStyles.headerButton,
              child: SizedBox(
                width: (_screenSize.width - 50) / 3,
                child: Text(AppStrings.doing,
                    textAlign: TextAlign.center,
                    style: _cubit.currentTable == 1
                        ? AppTextStyles.accentHeaderText
                        : AppTextStyles.headerText,),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _cubit.loadNotes("Done");
                });
              },
              style: _cubit.currentTable == 2
                  ? AppButtonStyles.accentHeaderButton
                  : AppButtonStyles.headerButton,
              child: SizedBox(
                  width: (_screenSize.width - 50) / 3,
                  child: Text(AppStrings.done,
                      textAlign: TextAlign.center,
                      style: _cubit.currentTable == 2
                          ? AppTextStyles.accentHeaderText
                          : AppTextStyles.headerText,))),
        ],
      ),
    );
  }
}
