import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_studio/controllers/notes_cubit/notes_cubit_cubit.dart';

import '../widgets/empty_notes_body.dart';
import '../widgets/my_app_bar_action_button.dart';
import '../widgets/my_floating_action_button.dart';
import '../widgets/notes_list_view_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              // showSearch(
              //   context: context,
              //   delegate: NotesSearchDelegate(notes: notes),
              // );
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
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            return BuildNotesListViewbuilder(userNoteList: state.notes);
          }
          return const Center(child: BuildEmptyNotesbody());
        },
      ),
    );
  }
}
