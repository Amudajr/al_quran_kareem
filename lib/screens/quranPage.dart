import 'package:al_quran_kareem/constants/contants.dart';
import 'package:al_quran_kareem/screens/juzzPage.dart';
import 'package:al_quran_kareem/screens/surah_detail.dart';
import 'package:flutter/material.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/surah.dart';
import '../widgets/surah_custom_tile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 200, 230, 255),
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
          title: Text(
            'Select Surah To Read',
            style: GoogleFonts.montserrat(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: apiService.getSurah(),
          builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
            if (snapshot.hasData) {
              List<Surah>? surah = snapshot.data;
              return ListView.builder(
                itemCount: surah!.length,
                itemBuilder: (context, index) => SurahCustomListTile(
                    surah: surah[index],
                    context: context,
                    ontap: () {
                      setState(() {
                        Constants.surahIndex = (index + 1);
                      });
                      Navigator.pushNamed(context, Surahdetail.id);
                    }),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
