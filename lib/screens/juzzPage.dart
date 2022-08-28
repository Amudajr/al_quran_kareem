import 'package:al_quran_kareem/constants/contants.dart';
import 'package:al_quran_kareem/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/juzz.dart';
import '../widgets/juz_custom_tile.dart';

class JuzzScreen extends StatelessWidget {
  static const String id = 'juzz_screen';

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<JuzzModel>(
          future: apiService.getJuzz(Constants.juzzIndex!),
          builder: (context, AsyncSnapshot<JuzzModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print('${snapshot.data!.juzAyahs.length} length');
              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzzCustomTile(
                      list: snapshot.data!.juzAyahs, index: index);
                },
              );
            } else {
              return Center(
                child: Text('Data Not Found'),
              );
            }
          }),
    ));
  }
}
