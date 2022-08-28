import 'package:al_quran_kareem/screens/splash.dart';
import 'package:al_quran_kareem/screens/juzzPage.dart';
import 'package:al_quran_kareem/screens/surah_detail.dart';
import 'package:flutter/material.dart';

import 'constants/contants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al Qur'an Kareem",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white),
      home: const SplashPage(),
      routes: {
        JuzzScreen.id: (context) => JuzzScreen(),
        Surahdetail.id: (context) => Surahdetail(),
      },
    );
  }
}
