import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class PryringTimeScreen extends StatefulWidget{
String fajer;
String Sunrise;
String Dhuhr;
String Asr;
String Maghrib;
String Isha;
PryringTimeScreen(this.fajer,this.Sunrise,this.Dhuhr,this.Asr,this.Maghrib,this.Isha);
  @override
  State<PryringTimeScreen> createState() => _PryringTimeScreenState();
}

class _PryringTimeScreenState extends State<PryringTimeScreen> {

  late GoogleMapController mapController;
  // animateMapToLocation(LatLng latLng){
  //   mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
  // }
  Future<double> getMyLocationlat()async{
    Position position = await Geolocator.getCurrentPosition();
    // animateMapToLocation(LatLng(position.latitude, position.longitude));
    // print('/////////////////////////////////////////////////////');
    // print(position.latitude);
    return position.latitude;
  }
  Future<double> getMyLocationlog()async{
    Position position = await Geolocator.getCurrentPosition();
    // animateMapToLocation(LatLng(position.latitude, position.longitude));
    // print('/////////////////////////////////////////////////////');
    // print(position.longitude);
    return position.longitude;
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('kk:mm:ss').format(now);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/WhatsApp Image 2022-08-27 at 4.47.27 PM.jpeg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h,),
            Row(
              children: [
                SizedBox(width: 25.w,),
                IconButton(onPressed: (){AppRouter.popRouter();}, icon: Icon(Icons.arrow_back_ios,size: 35,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
              ],
            ),
            SizedBox(height: 20.h,),
            InkWell(
              child: DigitalClock(
                areaWidth:double.infinity,
                hourMinuteDigitTextStyle: GoogleFonts.reemKufi(
                  color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                  fontSize: 50.sp,
                ),
                secondDigitTextStyle: TextStyle(
                  color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                  fontSize: 30.sp,
                ),
                areaDecoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.0),
                ),
                hourMinuteDigitDecoration: BoxDecoration(
                    border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                ),
                secondDigitDecoration:BoxDecoration(
                    border: Border.all(color:SettingScreen.isGreen?Color(0xFF344F24): Colors.black.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.5)
                ),
                //hourMinuteDigitTextStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 60.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Fajr',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                SizedBox(height: 10.h,),
                Text('Sunrise',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                SizedBox(height: 10.h,),
                Text('Dhuhr',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                SizedBox(height: 10.h,),
                Text('Asr',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                SizedBox(height: 10.h,),
                Text('Maghrib',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                SizedBox(height: 10.h,),
                Text('Isha',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
              ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(widget.fajer,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text(widget.Sunrise,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text(widget.Dhuhr,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text(widget.Asr,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text(widget.Maghrib,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text(widget.Isha,style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
              ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text('الفجر',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text('الشروق',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text('الظهر',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text('العصر',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text('المغرب',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                  SizedBox(height: 10.h,),
                Text('العشاء',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
              ],)
            ],)
          ],
        ),
      ),
    );
  }
}
