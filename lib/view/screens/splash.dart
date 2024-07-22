import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/images.dart';
import '../../utils/extentions/extentions.dart';
import '../../utils/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFinish = false;

  @override
  void initState() {
    super.initState();
    goToNextScreen();
    Future.delayed(const Duration(milliseconds: 2600),
        () => setState(() => _isFinish = true));
  }

  Future<void> goToNextScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 4200),
      () => Navigator.pushReplacementNamed(context, RouteManager.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              ImageManager.splashImage,
              width: context.width / 2,
              height: context.width / 2,
            ),
            _isFinish
                ? Text('Note Studio', style: context.textTheme.bodyLarge)
                : DefaultTextStyle(
                    style: context.textTheme.bodyLarge!,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        FlickerAnimatedText(
                          entryEnd: 1,
                          'Note Studio',
                          speed: const Duration(milliseconds: 2200),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
