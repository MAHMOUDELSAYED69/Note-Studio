import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_studio/utils/extentions/extentions.dart';
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
  void initState() {
    _titleController = TextEditingController(text: widget.noteData.title);
    _contentController = TextEditingController(text: widget.noteData.content);
    super.initState();
  }

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  bool _isTextFieldEnabled = false;
  @override
  Widget build(BuildContext context) {
    const inputBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.grey));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarActionButton(
                iconData: Icons.arrow_back_ios_rounded,
                onTap: () => Navigator.pop(context),
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
                    color: ColorManager.white, fontWeight: FontWeight.normal),
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
    );
  }
}
