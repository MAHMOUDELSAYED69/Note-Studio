import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../utils/helper/search_bar.dart';
import '../widgets/empty_notes_body.dart';
import '../widgets/my_app_bar_action_button.dart';
import '../widgets/my_floating_action_button.dart';
import '../widgets/notes_list_view_builder.dart';

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
  final List<UserNotesModel> _userNoteList = List<UserNotesModel>.generate(
    12,
    (index) => UserNotesModel(
        userNote: Faker().lorem.sentence(), time: Faker().date.justTime()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: _userNoteList.isNotEmpty
            ? BuildNotesListViewbuilder(userNoteList: _userNoteList)
            : const BuildEmptyNotesbody(),
      ),
    );
  }
}

class UserNotesModel {
  final String userNote;
  final String time;

  UserNotesModel({required this.userNote, required this.time});
}
