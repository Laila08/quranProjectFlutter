import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/model/quran_model.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/ayahWidget.dart';

class SurahWidget extends StatelessWidget{
  Surah surah;
  SurahWidget(this.surah);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 30.h,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          //padding: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border:Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
            borderRadius: BorderRadius.circular(20)
          ),
          width: double.infinity,
          child: ListTile(
            title: Text('${surah.name.toString()}',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black),textAlign: TextAlign.center,),
            trailing:Text(surah.number.toString(),style: GoogleFonts.reemKufi(fontSize: 20.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black ),),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${surah.numberOfAyahs}     عدد الآيات ',style: GoogleFonts.reemKufi(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.7)),),
                Text(surah.revelationType.toString()=='Meccan'?'مكية':'مدنية',style: GoogleFonts.reemKufi(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.7)),),
              ],
            ),
          )
        ),
        surah.number==114? SizedBox(height: 30.h,):SizedBox()
      ],
    );
    //   Container(
    //   padding: const EdgeInsets.only(right:25,left: 25,top: 25),
    //   width: double.infinity,
    //   child: Row(
    //     children: [
    //       Icon(Icons.description_outlined),
    //       SizedBox(width: 50,),
    //       Container(
    //         width: 300,
    //         padding: EdgeInsets.symmetric(vertical: 20),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           color: Colors.grey.withOpacity(0.2),
    //           border: Border.all(),
    //         ),
    //           child: Text(surah.name??'',style: GoogleFonts.reemKufi(fontSize: 25,),textAlign: TextAlign.center,)),
    //     ],
    //   ),
    // );
  }

}