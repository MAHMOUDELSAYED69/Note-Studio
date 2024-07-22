import 'package:flutter/material.dart';
import '../data/model/note_model.dart';
import '../view/screens/add_note.dart';
import '../view/screens/splash.dart';
import '../utils/constants/routes.dart';
import '../view/screens/home.dart';
import '../view/screens/view_note.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteManager.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteManager.addNoteScreen:
        return MaterialPageRoute(builder: (context) => const AddNoteScreen());
      case RouteManager.viewNoteScreen:
        final Note noteData = settings.arguments as Note;
        return MaterialPageRoute(
            builder: (context) => ViewNoteScreen(noteData: noteData));
      default:
        return null;
    }
  }
}
