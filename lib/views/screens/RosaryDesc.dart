import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/model/rosaryChat.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class RosaryDesc extends StatefulWidget{
  RosaryCatModel rosaryCatModel;
  RosaryDesc(this.rosaryCatModel);

  @override
  State<RosaryDesc> createState() => _RosaryDescState();
}

class _RosaryDescState extends State<RosaryDesc> {
  num counter =0;
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
            title: Text('تسبيح',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
            centerTitle: true,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/qu.jpeg'),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Text(widget.rosaryCatModel.name.toString(),style: GoogleFonts.reemKufi(fontSize: 27.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),textAlign: TextAlign.center,),
                  SizedBox(height: 30.h,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(counter.toString(),style: GoogleFonts.reemKufi(fontSize: 50.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),)),
                  SizedBox(height: 30.h,),
                  InkWell(
                    onTap: (){
                      counter++;
                      if(counter==widget.rosaryCatModel.count+1){
                        counter=0;
                        showDialog(context: context, builder: (context){
                          return Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height:150.h,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal.withOpacity(0.1),
                                  border: Border.all(width: 2.w),
                                  image: DecorationImage(
                                      image: AssetImage('assets/photo_2022-08-26_22-27-13.jpg'),fit: BoxFit.cover
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.done_outline_outlined,color: Color(
                                      0xFF579862),size: 30,),
                                  SizedBox(height: 20.h,),
                                  InkWell(
                                      onTap: (){AppRouter.popRouter();},
                                      child: Text('Done',style: GoogleFonts.reemKufi(fontSize: 30.sp,color: Color(0xFF395B64),)))
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      setState((){});
                    },
                    child: Container(
                      height: 90.h,
                      width: 80.w,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Color(0xFF395B64),
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}