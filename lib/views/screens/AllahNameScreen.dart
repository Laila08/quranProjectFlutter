import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/data/dummyData.dart';
import 'package:quranproject/views/screens/screen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/AllahNameWidget.dart';

class AllahNameScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
        title: Text('أسماء الله الحسنى',style: GoogleFonts.reemKufi(fontSize: 28.sp),),
        centerTitle: true,

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/done.jpeg'),
                fit: BoxFit.cover
            )
        ),
        child: ListView.builder(
            itemCount:posts.length,
            itemBuilder:(context,index){
              return AllahNameWidget(posts[index]);
            } ),
      ),
    );
  }

}