import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/views/screens/addPryScreen.dart';
import 'package:quranproject/views/screens/screen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/allPryringWidget.dart';
import 'package:quranproject/views/widgets/myPryringWidget.dart';

class PryringScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){AppRouter.NavigateToWidget(Screen());},icon:Icon(Icons.arrow_back_ios,color: Colors.white,)),
            backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
            title: Text('الأدعية',style: GoogleFonts.reemKufi(fontSize: 30.sp),),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(child: Text('أدعيتي',style: GoogleFonts.reemKufi(fontSize: 20.sp),),),
                Tab(child: Text('أدعية متنوعة',style: GoogleFonts.reemKufi(fontSize: 20.sp),),),
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
                AddPry(),
                MyPryringWidget(),
              ],
            ),
          ),
        ));
  }
  
}