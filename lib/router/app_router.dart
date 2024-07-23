import 'package:flutter/material.dart';
import '../data/model/note_model.dart';
import '../view/screens/add_note.dart';
import '../view/screens/splash.dart';
import '../utils/constants/routes.dart';
import '../view/screens/home.dart';
import '../view/screens/view_note.dart';
import 'page_transition.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return PageTransitionManager.materialPageRoute(const SplashScreen());
      case RouteManager.home:
        return PageTransitionManager.fadeTransition(
          const HomeScreen(),
        );

      case RouteManager.addNoteScreen:
        return PageTransitionManager.fadeTransition(
          const AddNoteScreen(),
        );
      case RouteManager.viewNoteScreen:
        final Note noteData = settings.arguments as Note;
        return PageTransitionManager.fadeTransition(
          ViewNoteScreen(noteData: noteData),
        );
      default:
        return null;
    }
  }
}
