import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/model/azkarCat.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class AzkarCatWidget extends StatelessWidget{
  AzkarCatModel azkarCatModel;
  AzkarCatWidget(this.azkarCatModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,x) {
        return Container(
          margin: EdgeInsetsDirectional.only(top: 30,start: 25,end: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${azkarCatModel.name??''}',style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(width: 20.w,),
                  Text('-',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  Text(azkarCatModel.number??'',style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                ],
              ),
              SizedBox(height: 15.h,),
              DottedLine(
                dashColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                lineLength: double.infinity,
                lineThickness:3 ,
              ),
              azkarCatModel.number==provider.azkarCatList.last.number?SizedBox(height: 30.h,):SizedBox()
          ],),
        );
      }
    );
  }

}