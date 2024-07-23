import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../controllers/notes_cubit/notes_cubit.dart';
import '../../utils/extentions/extentions.dart';
import '../../utils/helper/custom_sncakbar.dart';
import '../../utils/constants/routes.dart';
import '../../data/model/note_model.dart';
import '../../utils/constants/colors.dart';

class BuildNotesListViewbuilder extends StatefulWidget {
  const BuildNotesListViewbuilder({
    super.key,
    required this.userNoteList,
  });

  final List<Note> userNoteList;

  @override
  BuildNotesListViewbuilderState createState() =>
      BuildNotesListViewbuilderState();
}

class BuildNotesListViewbuilderState extends State<BuildNotesListViewbuilder> {
  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('d MMM');
    return formatter.format(dateTime);
  }

  int? selectedNoteIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 28),
      child: ListView.builder(
        itemCount: widget.userNoteList.length,
        itemBuilder: (context, index) {
          final note = widget.userNoteList[index];
          final isSelected = selectedNoteIndex == index;
          final color = isSelected
              ? ColorManager.red
              : ColorManager.colorList[index % ColorManager.colorList.length];

          return GestureDetector(
            onTap: () {
              if (isSelected) {
                setState(() {
                  selectedNoteIndex = null;
                });
              } else {
                Navigator.pushNamed(
                  context,
                  RouteManager.viewNoteScreen,
                  arguments: note,
                );
              }
            },
            onLongPress: () {
              setState(() {
                selectedNoteIndex = index;
              });
            },
            onTapCancel: () {
              setState(() {
                selectedNoteIndex = null;
              });
            },
            onTapDown: (_) {
              setState(() {
                selectedNoteIndex = null;
              });
            },
            child: Stack(alignment: Alignment.center, children: [
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                margin: EdgeInsets.symmetric(vertical: 9.h),
                width: context.width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  note.title.isNotEmpty ? note.title : note.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 22.sp,
                      color: isSelected ? ColorManager.red : ColorManager.dark),
                ),
              ),
              if (isSelected)
                Center(
                  child: IconButton(
                    icon: Icon(Icons.delete, size: 40.sp),
                    onPressed: () {
                      context.cubit<NotesCubit>().deleteNote(id: note.id);
                      setState(() {
                        selectedNoteIndex = null;
                      });
                      customSnackBar(context,
                          message: 'Note Deleted Successfully !');
                    },
                  ),
                ),
              Positioned(
                top: 20,
                left: 15,
                child: Text(
                  formatDateTime(note.lastModifiedDate),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: context.textTheme.bodySmall?.copyWith(
                      color: isSelected ? ColorManager.red : ColorManager.dark),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
