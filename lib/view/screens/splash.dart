import 'package:flutter/material.dart';

import '../../utils/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async => Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, RouteManager.home));
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
