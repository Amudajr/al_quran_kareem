import 'package:al_quran_kareem/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/translation.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;

  TranslationTile({required this.index, required this.surahTranslation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 200, 230, 255),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(blurRadius: 1)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                ),
                Positioned(
                  top: 3,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Text(
                      surahTranslation.aya!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(surahTranslation.arabic_text!,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(surahTranslation.translation!,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
