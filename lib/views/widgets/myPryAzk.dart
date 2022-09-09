import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/model/PryringCatModel.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:url_launcher/url_launcher.dart';
class MyPryerAzk extends StatefulWidget{
  List<PryCatModel> pryCatModel;
  int index;
  MyPryerAzk(this.index,this.pryCatModel);

  @override
  State<MyPryerAzk> createState() => _MyPryerAzkState();
}

class _MyPryerAzkState extends State<MyPryerAzk> {
  sendMessageByWhatsapp(String phone,String message){
    String url = "whatsapp://send?=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        width: MediaQuery.of(context).size.width-20,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 8,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/pr.jpeg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('${widget.pryCatModel[widget.index].number.toString()}',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),textAlign: TextAlign.center,)),
            SizedBox(height: 20.h,),
            Text('${widget.pryCatModel[widget.index].text.toString()}',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            Spacer(),
            DottedLine(
              dashColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
              lineLength: double.infinity,
              lineThickness:3 ,
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (){
                    setState((){
                      if(widget.index!=0){
                        widget.index--;
                      }
                    });
                  }, icon: Icon(Icons.arrow_back,size: 30,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                IconButton(onPressed: (){
                  sendMessageByWhatsapp('0599436111',widget.pryCatModel[widget.index].text??'');
                }, icon: Icon(Icons.share,size: 30,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                IconButton(onPressed: (){
                  setState((){
                    if(widget.index!=widget.pryCatModel.length-1){
                      widget.index++;
                    }
                  });
                }, icon: Icon(Icons.arrow_forward,size: 30,color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
              ],
            ),
          ],
        ));
  }
}