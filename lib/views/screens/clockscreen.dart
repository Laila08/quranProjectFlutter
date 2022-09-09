import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class ClockScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        DigitalClock(),
        SizedBox(
    height: 20.h,
    ),
        DigitalClock(
    is24HourTimeFormat: false,
    digitAnimationStyle: Curves.bounceInOut,
    ),
        SizedBox(
    height: 20.h,
    ),
        DigitalClock(
    digitAnimationStyle: Curves.elasticOut,
    is24HourTimeFormat: false,
    areaDecoration: BoxDecoration(
    color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: TextStyle(
    color: Colors.blueGrey,
    fontSize: 50.sp,
    ),
    amPmDigitTextStyle: TextStyle(
    color: Colors.blueGrey, fontWeight: FontWeight.bold),
    ),
        SizedBox(
    height: 20.h,
    ),
        DigitalClock(
    digitAnimationStyle: Curves.easeOutExpo,
    hourMinuteDigitTextStyle: TextStyle(
    color: Colors.yellow,
    fontSize: 50.sp,
    ),
    ),
        SizedBox(
    height: 20.h,
    ),
        DigitalClock(
    hourMinuteDigitTextStyle: TextStyle(
    color: Colors.yellow,
    fontSize: 50.sp,
    ),
    secondDigitTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 50.sp,
    ),
    ),
        SizedBox(
    height: 20.h,
    ),
        DigitalClock(
    areaWidth: 180.w,
    showSecondsDigit: false,
    hourMinuteDigitTextStyle: TextStyle(
    color: Colors.yellow,
    fontSize: 50.sp,
    ),
    ),
    ],
    ),)
    );
  }

}