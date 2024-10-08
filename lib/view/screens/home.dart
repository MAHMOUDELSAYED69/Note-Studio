import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/notes_cubit/notes_cubit.dart';
import '../../controllers/theme_cubit/theme_cubit.dart';
import '../../utils/cache/cache.dart';
import '../../utils/extentions/extentions.dart';

import '../../data/model/note_model.dart';
import '../../utils/helper/search_bar.dart';
import '../widgets/empty_notes_body.dart';
import '../widgets/my_app_bar_action_button.dart';
import '../widgets/my_floating_action_button.dart';
import '../widgets/notes_list_view_builder.dart';
import '../widgets/theme_mode_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];

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
            onTap: () => showSearch(
              context: context,
              delegate: NotesSearchDelegate(notes: _notes),
            ),
          ),
          const SizedBox(width: 20),
          const ThemeToggleButton(),
          const SizedBox(width: 24),
        ],
      ),
      floatingActionButton: const BuildFloatingActionButton(),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            _notes = state.notes;
            if (_notes.isEmpty) {
              return const Center(child: BuildEmptyNotesbody());
            }
            return BuildNotesListViewbuilder(userNoteList: state.notes);
          }
          return const Center(child: BuildEmptyNotesbody());
        },
      ),
    );
  }
}
