import 'package:al_quran_kareem/constants/contants.dart';
import 'package:al_quran_kareem/screens/audioPage.dart';
import 'package:al_quran_kareem/screens/homePage.dart';
import 'package:al_quran_kareem/screens/prayerPage.dart';
import 'package:al_quran_kareem/screens/quranPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> _widgetlist = [
    HomeScreen(),
    QuranScreen(),
    AudioScreen(),
    PrayerScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _widgetlist[selectedIndex],
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(
                  icon: Image.asset(
                    'assets/home.png',
                    color: Colors.white,
                  ),
                  title: 'Home'),
              TabItem(
                  icon: Image.asset(
                    'assets/holyQuran.png',
                    color: Colors.white,
                  ),
                  title: 'Quran'),
              TabItem(
                  icon: Image.asset(
                    'assets/audio.png',
                    color: Colors.white,
                  ),
                  title: 'Audio'),
              TabItem(
                  icon: Image.asset(
                    'assets/mosque.png',
                    color: Colors.white,
                  ),
                  title: 'Prayer'),
            ],
            initialActiveIndex: 0, //optional, default as 0
            onTap: updatedIndex,
            backgroundColor: Constants.kPrimary,
            activeColor: Constants.kPrimary,
          )),
    );
  }

  void updatedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
