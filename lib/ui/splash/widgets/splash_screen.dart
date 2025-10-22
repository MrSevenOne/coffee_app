import 'package:coffee_app/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    // animatsiya tugaganda home pagega yo‘naltirish
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor, // orqa fon (xohlasang o‘zgartir)
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json', // animatsiya joylashgan joy
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration =
                composition.duration * (1 / 0.75); // 0.75x tezlik
            _controller.forward();
          },
          repeat: false, // faqat 1 marta o‘ynaydi
        ),
      ),
    );
  }
}
