import 'package:flutter/material.dart';
import 'package:todo_app/pages/SplashScreens/splashscreen2.dart';
import 'package:todo_app/utils/animation/splash_animation.dart';
import 'package:todo_app/utils/page_route/fade_page_route.dart';

// ignore: must_be_immutable
class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late EnterAnimation fadeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 400),
    );

    fadeAnimation = EnterAnimation(controller);
    super.initState();

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          FadePageRoute(
            const SplashScreen2(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: fadeAnimation.animation,
      child: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: Container(
              height: deviceHeight * 1,
              width: deviceWidth * 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                      "assets/images/This_team-logos_transparent.png"),
                ),
              ),
            ),
          )),
    );
  }
}
