

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/model/contentAzkarModel.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class ContentAzkarWidget extends StatefulWidget{
  ContentAzkarModel contentAzkarModel;
  String catId;
  ContentAzkarWidget(this.contentAzkarModel,this.catId);

  @override
  State<ContentAzkarWidget> createState() => _ContentAzkarWidgetState();
}

class _ContentAzkarWidgetState extends State<ContentAzkarWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                  color: Colors.white.withOpacity(0.2),
                ),
                margin: EdgeInsetsDirectional.only(top: 20,start: 20,end: 20),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                child: Text(widget.contentAzkarModel.text??'',style:GoogleFonts.elMessiri(fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),textAlign: TextAlign.end,),
              ),
              SizedBox(height: 15.h,),
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                  color: widget.contentAzkarModel.count==0?Colors.red:Colors.white.withOpacity(0.2),
                ),
                child: TextButton(
                  onPressed: () {
                    if(widget.contentAzkarModel.count>0){
                      widget.contentAzkarModel.count--;
                    }
                   setState((){});
                },
                child: Text(widget.contentAzkarModel.count.toString(),style: GoogleFonts.reemKufi(fontSize: 16.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                ),
              ),
             widget.contentAzkarModel.text==provider.contentAzkarList.last.text?SizedBox(height: 30.h,):SizedBox()
             // SizedBox(height: 15,),

            ],
          );
        }
      );
  }
}