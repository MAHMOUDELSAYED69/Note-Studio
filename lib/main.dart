import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_studio/database/sql.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDatabase().initializeDatabase();
  runApp(const MyApp());
}
