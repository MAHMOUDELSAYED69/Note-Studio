import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/notes_cubit/notes_cubit.dart';
import '../../utils/extentions/extentions.dart';
import '../../utils/helper/my_dialog.dart';
import '../../utils/constants/colors.dart';
import '../../view/widgets/my_app_bar_action_button.dart';

import '../../data/model/note_model.dart';

class ViewNoteScreen extends StatefulWidget {
  const ViewNoteScreen({super.key, required this.noteData});
  final Note noteData;

  @override
  State<ViewNoteScreen> createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteData.title);
    _contentController = TextEditingController(text: widget.noteData.content);
    originalTitle = widget.noteData.title;
    originalContent = widget.noteData.content;
  }

  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late String originalTitle;
  late String originalContent;

  bool _isTextFieldEnabled = false;
  Future<bool> _updateNote() async {
    if (_titleController.text != originalTitle ||
        _contentController.text != originalContent) {
      final result = openMyDialog(
        context,
        submitButtonMethod: () {
          context.cubit<NotesCubit>().updateNote(
                id: widget.noteData.id,
                title: _titleController.text.trim(),
                content: _contentController.text.trim(),
              );
        },
      );
      return result ?? false;
    }
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.grey));
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _updateNote(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocListener<NotesCubit, NotesState>(
                  listener: (context, state) {
                    if (state is NoteUpdated) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }
                    if (state is NotesError) {
                      log(state.message.toString());
                    }
                  },
                  child: AppBarActionButton(
                      iconData: Icons.arrow_back_ios_rounded,
                      onTap: _updateNote),
                ),
                AppBarActionButton(
                  iconData: Icons.edit_outlined,
                  onTap: () {
                    _isTextFieldEnabled = !_isTextFieldEnabled;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  enabled: _isTextFieldEnabled,
                  controller: _titleController,
                  minLines: 1,
                  maxLines: 10,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    hintStyle: context.textTheme.displayLarge,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                  ),
                ),
                SizedBox(height: 33.h),
                TextField(
                  enabled: _isTextFieldEnabled,
                  controller: _contentController,
                  minLines: 1,
                  maxLines: 100,
                  style: context.textTheme.displayMedium?.copyWith(
                      color: context.textTheme.bodyMedium?.color,
                      fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                    hintStyle: context.textTheme.displayMedium,
                    enabledBorder: inputBorder,
                    focusedBorder: inputBorder,
                  ),
                ),
                SizedBox(height: 33.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
