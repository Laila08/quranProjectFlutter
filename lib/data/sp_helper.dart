import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferences;





  initSp() async{
    sharedPreferences =await SharedPreferences.getInstance();


  }
  putData({required String key,required bool value})async{
    return await sharedPreferences!.setBool(key, value);
  }
  getData({required String key}){
    return  sharedPreferences!.getBool(key);
  }
  setIsGreen(bool active)async{
    sharedPreferences!.setBool('isGreen', active);
  }

  bool?  getIsGreen(){
    return sharedPreferences!.getBool('isGreen');
  }

}