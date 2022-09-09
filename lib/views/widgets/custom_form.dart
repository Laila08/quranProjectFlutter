import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
class CustomField extends StatelessWidget{
  TextInputType ?textInputType;
  String ?hint;
  TextEditingController ?controller;
  final Function validator;
  CustomField({
    this.textInputType,
    this.hint,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 300.w,
      height: 60.h,
      child: TextFormField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        controller: controller,
        keyboardType: textInputType,
        validator:(x)=>validator(x),
        //minLines: 1,
        decoration: InputDecoration(
          filled: true,
            errorStyle:GoogleFonts.reemKufi(
              fontSize: 15.sp,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            focusedBorder:OutlineInputBorder(
              gapPadding: 20,
              borderSide: BorderSide(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),
            ),
            enabledBorder: OutlineInputBorder(
            gapPadding: 20,
            borderSide: BorderSide(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),
          ),
            errorBorder:OutlineInputBorder(
            gapPadding: 20,
            borderSide: BorderSide(color: Colors.black,
            ),
          ) ,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelBehavior:  FloatingLabelBehavior.always,
            labelText:hint,
            labelStyle:GoogleFonts.reemKufi(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,fontSize: 27.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
        ),
      ),
    );
  }
}