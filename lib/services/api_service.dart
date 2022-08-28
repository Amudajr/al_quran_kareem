import 'dart:convert';
import 'dart:math';
import 'package:al_quran_kareem/model/aya_of_the_day.dart';
import 'package:al_quran_kareem/model/juzz.dart';
import 'package:al_quran_kareem/model/qari.dart';
import 'package:al_quran_kareem/model/translation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/surah.dart';

class ApiService {
  final endpointurl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];
  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url =
        "https://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print('Failed');
      throw Exception('Failed To Load Post');
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    Response res = await http.get(Uri.parse(endpointurl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print("ol, ${list.length}");
      return list;
    } else {
      throw ("Can't get the Surah");
    }
  }

  Future<JuzzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return JuzzModel.fromJSON(json.decode(response.body));
    } else {
      print('Failed to Load');
      throw Exception('FAil to loa Juzz');
    }
  }

  Future<SurahTranslationList> getTranslation(
      int index, int translationIndex) async {
    String lan = "";
    if (translationIndex == 0) {
      lan = "english_saheeh";
    } else if (translationIndex == 1) {
      lan = "urdu_junagarhi";
    }

    final url = "https://quranenc.com/api/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJson(json.decode(res.body));
  }

  List<Qari> qarilist = [];
  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));
    jsonDecode(res.body).forEach((element) {
      if (qarilist.length < 20) qarilist.add(Qari.fromJson(element));
    });
    qarilist.sort((a, b) => a.name!.compareTo(b.name!));
    return qarilist;
  }
}
