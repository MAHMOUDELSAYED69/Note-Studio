import 'package:flutter/material.dart';

import '../utils/constants/routes.dart';

abstract class AppRouter {
  const AppRouter._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.initialRoute:
      default:
        return null;
    }
  }
}
