import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class OneAyahWidget extends StatelessWidget{
  final String text;
  final String numberInSurah;
  OneAyahWidget(this.text,this.numberInSurah);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20)
      ),
        child: ListTile(
          trailing: Text(numberInSurah,style: GoogleFonts.reemKufi(fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
          title:Text(text??'',style: TextStyle(fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),textAlign: TextAlign.end,),));
  }
}