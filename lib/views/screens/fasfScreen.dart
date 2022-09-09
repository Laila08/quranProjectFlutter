import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/views/screens/addPryScreen.dart';
import 'package:quranproject/views/screens/obligatoryFast.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/screens/volunteerPage.dart';
import 'package:quranproject/views/widgets/allPryringWidget.dart';
import 'package:quranproject/views/widgets/myPryringWidget.dart';

class FastScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
            title: Text('متتبع الصيام',style: GoogleFonts.reemKufi(fontSize: 30.sp),),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(child: Text('الواجب',style: GoogleFonts.reemKufi(fontSize: 20.sp),),),
                Tab(child: Text('التطوع',style: GoogleFonts.reemKufi(fontSize: 20.sp),),),
              ],
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/WhatsApp Image 2022-09-04 at 4.26.47 PM.jpeg'),
                  fit: BoxFit.cover,
                )
            ),
            child: TabBarView(
              children: [
                ObligatoryFast(),
                VolunteerPage(),
              ],
            ),
          ),
        ));
  }

}