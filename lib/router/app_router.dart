import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_studio/controllers/notes_cubit/notes_cubit_cubit.dart';
import '../data/model/note_model.dart';
import '../data/repository/note_repo.dart';
import '../data/sql/sql.dart';
import '../view/screens/add_note.dart';
import '../view/screens/splash.dart';
import '../utils/constants/routes.dart';
import '../view/screens/home.dart';
import '../view/screens/view_note.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final notesCubit = NotesCubit(NotesRepository(SqlDatabase()));
    switch (settings.name) {
      case RouteManager.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteManager.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: notesCubit,
                  child: const HomeScreen(),
                ));

      case RouteManager.addNoteScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: notesCubit,
                  child: const AddNoteScreen(),
                ));
      case RouteManager.viewNoteScreen:
        final Note noteData = settings.arguments as Note;
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: notesCubit,
                  child: ViewNoteScreen(noteData: noteData),
                ));
      default:
        return null;
    }
  }
}
