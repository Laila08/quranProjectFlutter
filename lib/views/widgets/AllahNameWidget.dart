import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/data/AllahName.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class AllahNameWidget extends StatelessWidget{
  AllahName allahName;
  AllahNameWidget(this.allahName);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Column(
        children: [
          Container(
            width: 200.w,
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              border: Border.all(
                width: 5.w,
                color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(allahName.name??'',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Text(allahName.text??'',textAlign: TextAlign.center,style:  GoogleFonts.reemKufi(fontSize: 20.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
          )
        ],
      ),
    );
  }

}