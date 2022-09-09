import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/model/PryringCatModel.dart';
import 'package:quranproject/model/allPryCatModel.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/UpdatePryScreen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:url_launcher/url_launcher.dart';

// class MyPryerAzk extends StatelessWidget{
//   PryCatModel pryCatModel;
//   MyPryerAzk(this.pryCatModel);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
//       padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
//       width: MediaQuery.of(context).size.width-20,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 8,
//             blurRadius: 7,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//         image: DecorationImage(
//           image: AssetImage('assets/pr.jpeg'),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(),
//       ),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//                 child: Text('${pryCatModel.number.toString()}',style: GoogleFonts.reemKufi(fontSize: 25,),textAlign: TextAlign.center,)),
//             SizedBox(height: 20,),
//             Text('${pryCatModel.text.toString()}',style: GoogleFonts.reemKufi(fontSize: 25,),textAlign: TextAlign.center,),
//             SizedBox(height: 20,),
//             Spacer(),
//             DottedLine(
//               dashColor: Colors.black,
//               lineLength: double.infinity,
//               lineThickness:3 ,
//             ),
//             SizedBox(height: 20,),
//             IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 30,),),
//           ],
//         ));
//   }
//
// }
class AllPryerAzk extends StatefulWidget{
  List<AllPryCatModel> allPryCatModel;
  int index;
  AllPryerAzk(this.index,this.allPryCatModel);

  @override
  State<AllPryerAzk> createState() => _AllPryerAzkState();

}

class _AllPryerAzkState extends State<AllPryerAzk> {
  num counter =0;
  sendMessageByWhatsapp(String phone,String message){
    String url = "whatsapp://send?=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,x) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 30),
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
              border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: (){
                          provider.pryNameController.text=widget.allPryCatModel[widget.index].name??'';
                          provider.pryCountController.text=(widget.allPryCatModel[widget.index].count).toString();
                          AppRouter.NavigateToWidget(UpdatePryScreen(widget.allPryCatModel[widget.index]));
                      },
                      icon: Icon(Icons.edit,size: 30,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                    Row(
                      children: [
                        Text(widget.allPryCatModel[widget.index].count.toString(),style: GoogleFonts.reemKufi(fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,)),
                        SizedBox(width: 10.w,),
                        Text('عدد المرات',style: GoogleFonts.reemKufi(fontSize: 17.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,)),
                      ],
                    ),
                    IconButton(
                      onPressed: (){
                        provider.deleteMyPry(widget.allPryCatModel[widget.index]);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                              content: Text('تم حذف الدعاء',textAlign: TextAlign.center,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                            ));
                      },
                      icon: Icon(Icons.remove,size: 30,color: Colors.red,),),
                  ],
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('${widget.allPryCatModel[widget.index].name.toString()}',style: GoogleFonts.reemKufi(fontSize: 25.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),textAlign: TextAlign.center,),
                ),
                SizedBox(height: 20.h,),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        counter++;
                        if(counter==widget.allPryCatModel[widget.index].count+1){
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
                                  border: Border.all(width: 2.w,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),
                                  image: DecorationImage(
                                    image: AssetImage('assets/photo_2022-08-26_22-27-13.jpg'),fit: BoxFit.cover
                                  )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.done_outline_outlined,color: Color(0xFF579862),size: 30,),
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
                        child: CircleAvatar(radius: 30,backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):SettingScreen.isGreen?Color(0xFF344F24):Colors.black,child: Text('Tap',style: GoogleFonts.reemKufi(color: Colors.white),),)),
                    Text('- - - - - - -',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Row(
                        children: [
                          CircleAvatar(child: Text(counter.toString(),style:GoogleFonts.reemKufi(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,fontSize: 20.sp) ,),backgroundColor: Colors.white),
                          SizedBox(width: 20.w,),
                          Text('التكرار',style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 25.sp)),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                          borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DottedLine(
                    dashColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                    lineLength: double.infinity,
                    lineThickness:3 ,
                  ),
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
                      }, icon: Icon(Icons.arrow_back,size: 30,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                    IconButton(onPressed: (){
                      sendMessageByWhatsapp('0599436111',widget.allPryCatModel[widget.index].name??'');
                    }, icon: Icon(Icons.share,size: 30,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                    IconButton(onPressed: (){
                      setState((){
                        if(widget.index!=widget.allPryCatModel.length-1){
                          widget.index++;
                        }
                      });
                    }, icon: Icon(Icons.arrow_forward,size: 30,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,),),
                  ],
                ),
              ],
            ));
      }
    );
  }
}