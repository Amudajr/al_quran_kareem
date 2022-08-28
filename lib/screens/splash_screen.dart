import 'dart:async';
import 'package:al_quran_kareem/screens/main_screen.dart';
import 'package:al_quran_kareem/screens/onBoarding_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyUsed = false;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
          const Duration(seconds: 5),
          () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return alreadyUsed ? MainScreen() : OnBoarding_Page();
              })));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                  "Al Qur'an Kareem",
                  textStyle: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('assets/islamic.png'),
          ),
        ],
      ),
    );
  }
}
