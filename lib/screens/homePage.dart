import 'package:al_quran_kareem/model/aya_of_the_day.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Column(children: [
        Container(
          height: size.height * 0.22,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background_img.jpg'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatted,
                style: TextStyle(fontSize: 30, color: Colors.white),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(_hijri.longMonthName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1))
                                ]),
                            child: Column(
                              children: [
                                Text("Quran Aya Of The Day",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.black,
                                ),
                                Text(
                                  snapshot.data!.arText!,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  snapshot.data!.enTran!,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
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
