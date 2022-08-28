import 'dart:math';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class QiblaPage extends StatefulWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  State<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  @override
  Widget build(BuildContext context) {
    Coordinates coordinates = Coordinates(9.0820, 8.6753);
    final qibla = Qibla(coordinates);
    double degree = qibla.direction;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Qiblah Finder'),
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 200, 230, 255),
        body: SizedBox(
          child: Stack(children: [
            Transform.rotate(
                angle: degree * 10, child: SvgPicture.asset('assets/5.svg')),
            Transform.rotate(
                angle: degree * 10, child: SvgPicture.asset('assets/3.svg')),
            Transform.rotate(
                angle: degree * 10, child: SvgPicture.asset('assets/4.svg')),
          ]),
        ));
  }
}
