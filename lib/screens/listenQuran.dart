import 'package:al_quran_kareem/model/qari.dart';
import 'package:al_quran_kareem/screens/audio_surah_screen.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:al_quran_kareem/widgets/qari_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ListenQuran extends StatefulWidget {
  const ListenQuran({Key? key}) : super(key: key);

  @override
  State<ListenQuran> createState() => _ListenQuranState();
}

class _ListenQuranState extends State<ListenQuran> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 230, 255),
      appBar: AppBar(
        title: Text('Reciters'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.black54,
                      spreadRadius: 0.0,
                      offset: Offset(0, 1),
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Search Your Preferred Reciter',
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.search)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future: apiService.getQariList(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Qari>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Reciter's data not found"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Qaris(
                        qari: snapshot.data![index],
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => AudioSurahScreen(
                                      qari: snapshot.data![index]))));
                        });
                  },
                );
              },
            ),
          ),
        ],
      )),
    ));
  }
}
