import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/AllahNameScreen.dart';
import 'package:quranproject/views/screens/aboutScreen.dart';
import 'package:quranproject/views/screens/azkarScreen.dart';
import 'package:quranproject/views/screens/fasfScreen.dart';
import 'package:quranproject/views/screens/pryringScreen.dart';
import 'package:quranproject/views/screens/pryringTimeScreen.dart';
import 'package:quranproject/views/screens/rosaryScreen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/screens/surahScreen.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Screen extends StatefulWidget{
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var indexList = ['سبحان الله','الحمد لله','الله أكبر','أستغفر الله'];

  @override
  Widget build(BuildContext context) {
    Future<Position> _determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }
    String fajer = '';
    adhanFajr()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes =  PrayerTimes(coordinates,dateTime,calculationParameters,);
      return '${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}';
    }
    adhanFajrString() async {
      Future<String> stringFuture = adhanFajr();
      String message = await stringFuture;
      fajer=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    String Dhuhr = '';
    Future<String>  adhanDhuhr()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
      //print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
      return '${prayerTimes.dhuhr.hour}:${prayerTimes.dhuhr.minute}';
    }
    adhanDhuhrString() async {
      Future<String> stringFuture = adhanDhuhr();
      String message = await stringFuture;
      Dhuhr=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    String Asr = '';
    adhanAsr()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
      //print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
      return '${prayerTimes.asr.hour}:${prayerTimes.asr.minute}';
    }
    adhanAsrString() async {
      Future<String> stringFuture = adhanAsr();
      String message = await stringFuture;
      Asr=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    String Sunrise = '';
    adhanSunrise()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
      //print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
      return '${prayerTimes.sunrise.hour}:${prayerTimes.sunrise.minute}';
    }
    adhanSunriseString() async {
      Future<String> stringFuture = adhanSunrise();
      String message = await stringFuture;
      Sunrise=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    String Maghrib = '';
    adhanMaghrib()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
      //print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
      return '${prayerTimes.maghrib.hour}:${prayerTimes.maghrib.minute}';
    }
    adhanMaghribString() async {
      Future<String> stringFuture = adhanMaghrib();
      String message = await stringFuture;
      Maghrib=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    String Isha = '';
    adhanIsha()async{
      Position position = await Geolocator.getCurrentPosition();
      Coordinates coordinates =  Coordinates(position.longitude,position.longitude);
      DateComponents dateTime = DateComponents.from(DateTime.now());
      CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
      PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
      //print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
      return '${prayerTimes.isha.hour}:${prayerTimes.isha.minute}';
    }
    adhanIshaString() async {
      Future<String> stringFuture = adhanIsha();
      String message = await stringFuture;
      Isha=message;
      print(message); // will print one on console.
    }
    /////////////////////////////////////////////////////////////////////////
    //DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day) ;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    String formattedDay = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('kk:mm').format(now);
    /////////////////////////////////////////////////////////////////////////
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:  Text('هل تريد تأكيد الخروج؟',style: GoogleFonts.reemKufi(fontSize: 23.sp),textAlign: TextAlign.center,),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child:  Text('Yes',style: GoogleFonts.reemKufi(fontSize: 20.sp,color: Color(0xFF496E35)),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child:  Text('No',style: GoogleFonts.reemKufi(fontSize: 20.sp,color: Color(0xFF496E35)),),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Consumer<FireStoreProvider>(
          builder: (context,provider,x) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 35,),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(SettingScreen());
                          },
                          child: Icon(Icons.info_outline,color: Colors.white,size: 33,)),
                      SizedBox(width: 20.w,),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50,right: 50,bottom: 10,top: 15),
                    padding: EdgeInsetsDirectional.only(top: 45,start: 10),
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.4),
                        image: DecorationImage(
                        image: AssetImage('assets/Mosque-PNG-Pic-removebg-preview (2).png'),fit: BoxFit.cover
                      )
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formattedDay,style: GoogleFonts.reemKufi(fontSize: 23.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                          Text(formattedDate,style: GoogleFonts.reemKufi(fontSize: 15.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                          Row(
                            children: [
                              Spacer(),
                              DigitalClock(
                                areaWidth:145.w,
                                hourMinuteDigitTextStyle: GoogleFonts.reemKufi(
                                  color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                                  fontSize: 30.sp,
                                ),
                                secondDigitTextStyle: TextStyle(
                                  color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                                  fontSize: 15.sp,
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
                                    border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                //hourMinuteDigitTextStyle: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 80.h,),
                          CarouselSlider.builder(
                              itemCount: indexList.length,
                              itemBuilder: (context,index,x){
                                return Text(indexList[index],style: GoogleFonts.reemKufi(fontSize: 30.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),);
                              },
                              options: CarouselOptions(autoPlay: true,
                                height: 50.h,
                                enlargeCenterPage: true,
                                viewportFraction: .9,
                                aspectRatio: 1.0,
                                initialPage: 0,)),
                        ],
                      )),
                  SizedBox(height: 80.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: [
                      InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(SurahScreen());
                          },
                          child: _buildCategory('سور القرآن')),
                      SizedBox(width: 20.w,),
                      InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(AzkarScreen());
                          },
                          child: _buildCategory('أذكار'))
                    ],),
                  ),
                  SizedBox(height:20.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(children: [
                      InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(RosaryScreen());
                          },
                          child: _buildCategory('السبحة')),
                      SizedBox(width: 20.w,),
                      InkWell(
                          onTap: ()async{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.tag_faces,color: Colors.white,),
                                      SizedBox(width:15.w ,),
                                      Text('انتظر قليلا',textAlign: TextAlign.center,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                                    ],
                                  ),
                                ));
                            _determinePosition();
                             await adhanFajrString();
                             await adhanAsrString();
                             await adhanDhuhrString();
                             await adhanIshaString();
                             await adhanMaghribString();
                             await adhanSunriseString();
                             print(fajer);
                            AppRouter.NavigateToWidget(PryringTimeScreen(fajer,Sunrise,Dhuhr,Asr,Maghrib,Isha));
                          },
                          child: _buildCategory('وقت الصلاة'))
                    ],),
                  ),
                  SizedBox(height:20.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(children: [
                      InkWell(
                          onTap:(){
                            AppRouter.NavigateToWidget(FastScreen());
                          },
                          child: _buildCategory('متتبع الصيام')),
                      SizedBox(width: 20.w,),
                      InkWell(
                        onTap: (){
                          AppRouter.NavigateToWidget(PryringScreen());
                        },
                          child: _buildCategory('أدعية'))
                    ],),
                  ),
                  SizedBox(height:20.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(children: [
                      InkWell(
                          onTap:(){
                            AppRouter.NavigateToWidget(AllahNameScreen());
                          },
                          child: _buildCategory('أسماء الله')),
                      SizedBox(width: 20.w,),
                      InkWell(
                          onTap: (){
                            AppRouter.NavigateToWidget(AboutScreen());
                          },
                          child: _buildCategory('من نحن'))
                    ],),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/photo_2022-08-26_22-27-07.jpg'),fit: BoxFit.cover),
              ),
            );
          }
        ),
      ),
    );
  }
}
Widget _buildCategory(String name){
  return Container(
    width: 160.w,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black)
    ),
    child: Center(child: Text(name,style:GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,))),
  );
}