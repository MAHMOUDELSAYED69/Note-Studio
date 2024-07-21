import 'package:flutter/material.dart';
import '../view/screens/splash.dart';

import '../utils/constants/routes.dart';
import '../view/screens/home.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteManager.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}
