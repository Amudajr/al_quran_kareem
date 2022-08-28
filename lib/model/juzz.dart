import 'dart:convert';

class JuzzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzzModel({required this.juzNumber, required this.juzAyahs});
  factory JuzzModel.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();
    return JuzzModel(juzNumber: json['data']['number'], juzAyahs: juzAyahList);
  }
}

class JuzAyahs {
  final String ayahsText;
  final int ayaNumber;
  final String surahName;

  JuzAyahs(
      {required this.ayahsText,
      required this.ayaNumber,
      required this.surahName});
  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
        ayaNumber: json['number'],
        ayahsText: json['text'],
        surahName: json['surah']['name']);
  }
}
