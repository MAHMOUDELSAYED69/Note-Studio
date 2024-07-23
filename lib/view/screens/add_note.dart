import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/notes_cubit/notes_cubit.dart';
import '../../utils/extentions/extentions.dart';

import '../../utils/helper/my_dialog.dart';
import '../widgets/my_app_bar_action_button.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();

    super.initState();
  }

  Future<bool> _confirmDialog() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();
    if (title.isNotEmpty && content.isNotEmpty) {
      final result = await openMyDialog(
        context,
        submitButtonText: 'save',
        title: 'Are you sure you want to discard your changes?',
        submitButtonMethod: () =>
            context.cubit<NotesCubit>().addNote(title: title, content: content),
      );
      return result ?? false;
    }
    Navigator.pop(context);
    return true;
  }

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NoteAdded) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
        if (state is NotesError) {
          log(state.message.toString());
        }
      },
      // ignore: deprecated_member_use
      child: WillPopScope(
        onWillPop: _confirmDialog,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                const SizedBox(width: 20),
                AppBarActionButton(
                    iconData: Icons.arrow_back_ios_rounded,
                    onTap: () => _confirmDialog()),
              ],
            ),
            actions: [
              AppBarActionButton(
                iconData: Icons.remove_red_eye_outlined,
                onTap: () {
                  _titleController.text = '';
                  _contentController.text = '';
                  setState(() {});
                },
              ),
              const SizedBox(width: 20),
              AppBarActionButton(
                  iconData: Icons.save_outlined, onTap: _confirmDialog),
              const SizedBox(width: 24),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    minLines: 1,
                    maxLines: 5,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: context.textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    controller: _contentController,
                    minLines: 1,
                    maxLines: 20,
                    style: context.textTheme.displayMedium?.copyWith(
                        color: context.textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      hintText: 'Type something...',
                      hintStyle: context.textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
