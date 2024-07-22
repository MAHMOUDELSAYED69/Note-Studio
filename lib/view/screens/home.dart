import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_studio/utils/constants/images.dart';
import 'package:note_studio/utils/extentions/extentions.dart';

import '../../utils/helper/search_bar.dart';
import '../widgets/my_app_bar_action_button.dart';
import '../widgets/my_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> notes = [
    'Note 1',
    'Note 2',
    'Note 3',
    'Note 4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text('Notes'),
        ),
        actions: [
          AppBarActionButton(
            iconData: Icons.search,
            onTap: () {
              showSearch(
                context: context,
                delegate: NotesSearchDelegate(notes: notes),
              );
            },
          ),
          const SizedBox(width: 20),
          AppBarActionButton(
            iconData: Icons.info_outline_rounded,
            onTap: () {},
          ),
          const SizedBox(width: 24),
        ],
      ),
      floatingActionButton: const BuildFloatingActionButton(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageManager.firstNote,
              width: context.width / 1.2,
            ),
            SizedBox(height: 5.h),
            Text(
              'Create your first note !',
              style: context.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
