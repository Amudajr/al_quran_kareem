import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({Key? key}) : super(key: key);

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Location location = new Location();
  LocationData? _currentPosition;
  late double latitude, longitude;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Prayer Times",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
          future: getLoc(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final myCoordinates = Coordinates(8.1574, 3.6147);
            final params = CalculationMethod.karachi.getParameters();
            params.madhab = Madhab.shafi;
            final prayerTimes = PrayerTimes.today(myCoordinates, params);

            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Row(children: [
                      Text('Fajr',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.fajr),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Text('Sunrise',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.sunrise),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Text('Dhuhr',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.dhuhr),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Text('Asr',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.asr),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Text('Magrib',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.maghrib),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Text('Ishai',
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(DateFormat.jm().format(prayerTimes.isha),
                          style: GoogleFonts.montserrat(
                              fontSize: 12, fontWeight: FontWeight.bold))
                    ]),
                  ),
                ],
              ),
            );
          }),
    ));
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude!;
    longitude = _currentPosition!.longitude!;
  }
}
