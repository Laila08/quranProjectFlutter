import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/model/quran_model.dart';
import 'package:quranproject/provider/quran_provider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/oneAyahWidget.dart';

class AyahWidget extends StatelessWidget{
  SurahAyah surah;
  AyahWidget(this.surah);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
       title:Container(
           width: double.infinity,
           child: Text(surah.name??'',style: GoogleFonts.reemKufi(fontSize: 25.sp,),textAlign: TextAlign.center,),)

       //surah.name!.length>8?Text(surah.name??'',style: GoogleFonts.reemKufi(fontSize: 15),):Text(surah.name??'',style: GoogleFonts.reemKufi(fontSize: 22),)
     ),
     body: Consumer<QuranProvider>(
         builder: (context,provider,x) {
           return Container(
             height: double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/WhatsApp Image 2022-08-27 at 7.09.18 PM.jpeg'),fit: BoxFit.cover
               )
             ),
             child: ListView.builder(
                 itemCount:surah.getAyahs().length ,
                 itemBuilder: (context,index){
                   return OneAyahWidget(surah.getAyahs()![index]!,surah.getAyahsNumber()![index]!);
                 }
             ),
           );
         }
     ),
   );
  }

}