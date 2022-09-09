import 'dart:math';

import 'package:dio/dio.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/model/quran_model.dart';

class QuranDioHelper{
  QuranDioHelper._();
  static QuranDioHelper quranDioHelper = QuranDioHelper._();
  Dio dio = Dio();
  Future<QuranResponse> getSurah()async{
    Response response = await dio.get('http://api.alquran.cloud/v1/surah',
    );
    QuranResponse quranResponse = QuranResponse.fromJson(response.data);
    return quranResponse;
  }
  Future<SurahAyah> getAyah(int id)async{
    Response response = await dio.get('http://api.alquran.cloud/v1/surah/$id',);
    print("response: ${response.data}");
    SurahAyah ayahsResponse = SurahAyah.fromJson(response.data['data']);
    return ayahsResponse;
  }

}