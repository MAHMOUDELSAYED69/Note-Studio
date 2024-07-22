import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/routes.dart';
import '../../data/model/note_model.dart';
import '../../utils/extentions/extentions.dart';

import '../../utils/constants/colors.dart';

class BuildNotesListViewbuilder extends StatelessWidget {
  const BuildNotesListViewbuilder({
    super.key,
    required List<Note> userNoteList,
  }) : _userNoteList = userNoteList;

  final List<Note> _userNoteList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 28),
      child: ListView.builder(
        itemCount: _userNoteList.length,
        itemBuilder: (context, index) {
          final color =
              ColorManager.colorList[index % ColorManager.colorList.length];
          final note = _userNoteList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteManager.viewNoteScreen,
                  arguments: note);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
              margin: EdgeInsets.symmetric(vertical: 9.h),
              width: context.width,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    note.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 22.sp, color: ColorManager.dark),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
