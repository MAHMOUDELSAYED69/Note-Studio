import 'dart:async';

import 'package:flutter/material.dart';
import '../../utils/cache/cache.dart';
import 'data/sql/sql.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDatabase().initializeDatabase();
  await CacheData.cacheDataInit();
  runApp(const MyApp());
}
