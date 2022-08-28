import 'dart:async';

import 'package:al_quran_kareem/screens/mainDashboard.dart';
import 'package:al_quran_kareem/screens/onBoarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  bool alreadyUsed = false;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return alreadyUsed ? MainDashboard() : OnBoarding_Page();
            })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 100,
            child: Text("Al Qur'an Kareem",
                style: GoogleFonts.greatVibes(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
