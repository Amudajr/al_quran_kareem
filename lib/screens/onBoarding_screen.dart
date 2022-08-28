import 'package:al_quran_kareem/screens/mainDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OnBoarding_Page extends StatelessWidget {
  final _pages = [
    PageModel(
        color: Colors.grey[700],
        imageAssetPath: "assets/grad_logo.png",
        title: "The Holy Qur'an",
        body:
            "\"Indeed, It is We who sent the Qur'and indeed, We will be it Guardian\"\n",
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 102, 176, 213),
        imageAssetPath: "assets/salam.png",
        title: "Greetings",
        body: "\"Peace be upon you and your household\"\n",
        doAnimateImage: true),
    PageModel(
        color: Color.fromARGB(255, 144, 144, 144),
        imageAssetPath: "assets/remember.png",
        title: "Reminder",
        body: "\"Verily, in the remeberance of Allah do heart find rest\"\n",
        doAnimateImage: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: _pages,
        showBullets: true,
        skipCallback: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MainDashboard(),
            )),
        finishCallback: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MainDashboard(),
            )),
      ),
    );
  }
}
