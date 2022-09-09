import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/data/sp_helper.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/rosaryScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget{
  sendMessageByWhatsapp(String phone,String message){
    String url = "whatsapp://send?=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }
  //SpHelper.spHelper.setIsGreen();
 static bool isGreen=SpHelper.spHelper.getIsGreen()??false;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Consumer<FireStoreProvider>(
          builder: (context,provider,x) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/photo_2022-08-26_22-27-07.jpg'),
                   fit: BoxFit.cover
                 ) ),
              child: Column(
                children: [
                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w,),
                      IconButton(onPressed: (){AppRouter.popRouter();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 35,)),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 70,right: 70,bottom: 30,top: 15),
                      height: 240.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.4),
                          image: DecorationImage(
                              image: AssetImage('assets/qu - Copy.jpg'),fit: BoxFit.cover
                          ),
                        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 20.h,),

                        ],
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.6),
                      border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          SettingScreen.isGreen=false;
                          SpHelper.spHelper.setIsGreen(SettingScreen.isGreen);
                          print('black');
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                              content: Text('تم ادراج اللون الاسود',textAlign: TextAlign.end,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                          ));
                          setState((){});
                        }, icon: Icon(Icons.color_lens_outlined,color: Colors.black,size: 40,)),
                        IconButton(onPressed: (){
                          SettingScreen.isGreen=true;
                          SpHelper.spHelper.setIsGreen(SettingScreen.isGreen);
                          print('green');
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                                content: Text('تم ادراج اللون الأخضر',textAlign: TextAlign.end,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                              ));
                          setState((){});
                        }, icon: Icon(Icons.color_lens_outlined,color: Color(0xFF344F24),size: 40,)),
                        SizedBox(width: 83.w,),
                        Text('لون التطبيق',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      widget.sendMessageByWhatsapp('0599436111','hello');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.6),
                        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            setState((){});
                          }, icon: Icon(Icons.share_outlined,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,size: 40,)),
                          Spacer(),
                          Text('مشاركة التطبيق',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      widget.sendMessageByWhatsapp('0599436111','hello');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.6),
                        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            setState((){});
                          }, icon: Icon(Icons.contact_phone,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,size: 40,)),
                          Spacer(),
                          Text('تواصل معنا',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      AppRouter.NavigateToWidget(RosaryScreen());
                      },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),

                      decoration: BoxDecoration(
                        color: Colors.white70.withOpacity(0.6),
                        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/pngtree-orange-tasbih-png-image_7503195.png',width: 70.w,height: 70.h,),
                          Spacer(),
                          Text('تسابيحي',style: GoogleFonts.reemKufi(fontSize: 25.sp,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: Text('green',),
                  //   onPressed: (){
                  //     print('befor ${SettingScreen.isGreen}');
                  //     SettingScreen.isGreen=!SettingScreen.isGreen;
                  //     SpHelper.spHelper.setIsGreen(SettingScreen.isGreen);
                  //     print('after ${SettingScreen.isGreen}');
                  //     setState((){});
                  //     //SpHelper
                  //    // SpHelper.spHelper.putData(key: 'isGreen', value:SpHelper.spHelper.getIsGreen);
                  //   },
                  // ),

                ],
              ),
            );
          }
        ),
      );
  }
}