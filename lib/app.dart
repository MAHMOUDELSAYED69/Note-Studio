import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Nest',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
