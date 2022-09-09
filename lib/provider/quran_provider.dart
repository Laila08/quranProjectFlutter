import 'package:flutter/material.dart';
import 'package:quranproject/data/quranDio_helper.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/model/quran_model.dart';

class QuranProvider extends ChangeNotifier{
  QuranProvider(){
    getSurah();
  }
  List<Surah> surahList=[];
  List<Ayahs> ayahList=[];
  getSurah ()async{
    QuranResponse quranResponse = await QuranDioHelper.quranDioHelper.getSurah();
    surahList.addAll(quranResponse.data??[]);
    print(surahList.toString());
    notifyListeners();
  }
  Future<SurahAyah> getSurahById (int id)async{
    ayahList.clear();
    notifyListeners();
    SurahAyah ayahsResponse = await QuranDioHelper.quranDioHelper.getAyah(id);
    print("gettig surah: ${ayahsResponse.toJson()}");
    return ayahsResponse;
  }
}