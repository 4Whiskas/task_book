import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:task_meneger/data/database/app_database.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_text_styles.dart';
import '../../utils.dart';

class BottomTaskView extends StatelessWidget {
  const BottomTaskView({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NotesTableData note;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      color: AppColors.baseCardColor,
      child: Column(
        children: [
          Container(
            height: 2,
            color: AppColors.accentColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(note.title, style: AppTextStyles.headerText),
                    Text(Utils.dateFormatter(note.deadLine),
                        style: AppTextStyles.headerText),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
                    child: Text(note.description,
                        style: AppTextStyles.baseText
                            .copyWith(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
