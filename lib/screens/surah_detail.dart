import 'package:al_quran_kareem/constants/contants.dart';
import 'package:al_quran_kareem/model/surah.dart';
import 'package:al_quran_kareem/model/translation.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:al_quran_kareem/widgets/custom_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

enum Translation { english, urdu }

class Surahdetail extends StatefulWidget {
  const Surahdetail({
    Key? key,
  }) : super(key: key);

  static const String id = 'surahDetail_screen';

  @override
  State<Surahdetail> createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiService apiService = ApiService();
  Translation? _translation = Translation.english;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 230, 255),
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          "",
          style: GoogleFonts.montserrat(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
          future: apiService.getTranslation(
              Constants.surahIndex!, _translation!.index),
          builder: (BuildContext context,
              AsyncSnapshot<SurahTranslationList> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: snapshot.data!.translationList.length,
                  itemBuilder: (context, index) {
                    return TranslationTile(
                        index: index,
                        surahTranslation:
                            snapshot.data!.translationList[index]);
                  },
                ),
              );
            } else {
              return Center(
                child: Text('Translation Not Found'),
              );
            }
          }),
      bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: Center(
              child: Text(
                "Swipe Up ⇡",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  ListTile(
                    title: Text("English",
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    leading: Radio<Translation>(
                      value: Translation.english,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Urdu",
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    leading: Radio<Translation>(
                      value: Translation.urdu,
                      groupValue: _translation,
                      onChanged: (Translation? value) {
                        setState(() {
                          _translation = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
          )),
    );
  }
}
