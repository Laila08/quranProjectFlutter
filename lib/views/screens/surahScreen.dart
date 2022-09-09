import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/data/quranDio_helper.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/provider/quran_provider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/ayahWidget.dart';
import 'package:quranproject/views/widgets/surahWidget.dart';

class SurahScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
        title: Text('سور القرآن',style: GoogleFonts.reemKufi(fontSize: 30.sp),),
      ),
      body: Consumer<QuranProvider>(
        builder: (context,provider,x) {
          return provider.surahList.isEmpty ?
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/WhatsApp Image 2022-08-27 at 7.09.18 PM.jpeg'),fit: BoxFit.cover
                )
            ),
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF26262A),
                rightDotColor: const Color(0xFF645D60),
                size: 100,
              ),
            ),):
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/WhatsApp Image 2022-08-27 at 7.09.18 PM.jpeg'),
                  fit: BoxFit.cover
                )
              ),
              child: ListView.builder(
              itemCount:provider.surahList.length ,
              itemBuilder:(context,index){
                return InkWell(
                    onTap: ()async{
                    SurahAyah surahAyah = await provider.getSurahById(provider.surahList[index].number!);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return AyahWidget(surahAyah);}));
                    },
                    child: SurahWidget(provider.surahList[index]));}),
            );
        }
      ),
    );
  }

}