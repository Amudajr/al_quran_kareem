import 'package:al_quran_kareem/model/aya_of_the_day.dart';
import 'package:al_quran_kareem/screens/juzzPage.dart';
import 'package:al_quran_kareem/screens/listenQuran.dart';
import 'package:al_quran_kareem/screens/prayerPage.dart';
import 'package:al_quran_kareem/screens/qibla_Page.dart';
import 'package:al_quran_kareem/screens/quranPage.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  ApiService _apiService = ApiService();

  void setData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE, d MM yyyy');
    var formatted = format.format(day);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 230, 255),
      body: Column(children: [
        Container(
          height: size.height * 0.22,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/dashboard.jpg'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatted,
                style: GoogleFonts.gabriela(fontSize: 30, color: Colors.white),
              ),
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                      style: TextStyle(fontSize: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          _hijri.hDay.toString(),
                          style: GoogleFonts.mountainsOfChristmas(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(_hijri.longMonthName,
                            style: GoogleFonts.mountainsOfChristmas(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      style: GoogleFonts.mountainsOfChristmas(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('${_hijri.hYear} AH',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 168, 231, 221),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => QuranScreen(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/quranRail.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Read Quran',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              ListenQuran())));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/listen.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Listen To Quran',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PrayerScreen(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/time.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Prayer Times',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => JuzzScreen(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/juzz.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Juz',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => QiblaPage())));
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/qibla.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Find Qibla',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PrayerScreen(),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      foregroundImage:
                                          AssetImage('assets/about.jpg'),
                                      radius: 30,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('About Us',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FutureBuilder<AyaOfTheDay>(
                    future: _apiService.getAyaOfTheDay(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Icon(Icons.sync_problem);
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return CircularProgressIndicator();
                        case ConnectionState.done:
                          return Container(
                            margin: EdgeInsetsDirectional.all(16),
                            padding: EdgeInsetsDirectional.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Color.fromARGB(255, 168, 231, 221),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1))
                                ]),
                            child: Column(
                              children: [
                                Text("Quran Aya Of The Day",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.black,
                                ),
                                Text(
                                  snapshot.data!.arText!,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  snapshot.data!.enTran!,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                RichText(
                                    text: TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data!.surNumber!.toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  )),
                                  WidgetSpan(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data!.surEnName!,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  )),
                                ]))
                              ],
                            ),
                          );
                      }
                    }),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
