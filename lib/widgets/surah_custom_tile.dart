import 'package:flutter/material.dart';
import 'package:al_quran_kareem/model/surah.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SurahCustomListTile(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 3.0),
      ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 40,
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Text(
                  (surah.number!.toString()),
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName!,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    surah.englishNameTranslation!,
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
              Spacer(),
              Text(
                surah.name!,
                style: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    ),
  );
}
