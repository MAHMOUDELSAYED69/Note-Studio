import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_studio/controllers/notes_cubit/notes_cubit_cubit.dart';
import '../../utils/constants/colors.dart';
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

  late TextEditingController _titleController;
  late TextEditingController _contentController;
  @override
  Widget build(BuildContext context) {
    final notesCubit = context.cubit<NotesCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const SizedBox(width: 20),
            AppBarActionButton(
              iconData: Icons.arrow_back_ios_rounded,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        actions: [
          AppBarActionButton(
            iconData: Icons.visibility_outlined,
            onTap: () {},
          ),
          const SizedBox(width: 20),
          BlocListener<NotesCubit, NotesState>(
            listener: (context, state) {
              if (state is NoteAdded) {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
              if (state is NotesError) {
                log(state.message.toString());
              }
            },
            child: AppBarActionButton(
              iconData: Icons.save_outlined,
              onTap: () => openMyDialog(
                context,
                submitButtonText: 'Save',
                title: 'Save changes ?',
                submitButtonMethod: () {
                  final title = _titleController.text.trim();
                  final content = _contentController.text.trim();
                  if (title.isNotEmpty && content.isNotEmpty) {
                    notesCubit.addNote(title: title, content: content);
                  }
                },
              ),
            ),
          ),
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
                    color: ColorManager.white, fontWeight: FontWeight.normal),
                decoration: InputDecoration(
                  hintText: 'Type something...',
                  hintStyle: context.textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
