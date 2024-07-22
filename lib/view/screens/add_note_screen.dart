import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_studio/utils/constants/colors.dart';
import 'package:note_studio/utils/extentions/extentions.dart';

import '../../utils/helper/my_dialog.dart';
import '../widgets/my_app_bar_action_button.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          AppBarActionButton(
            iconData: Icons.save_outlined,
            onTap: () => openMyDialog(
              context,
              submitButtonText: 'Save',
              title: 'Save changes ?',
              submitButtonMethod: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
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
