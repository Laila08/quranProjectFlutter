import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/model/rosaryChat.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/screens/updateRosaryScreen.dart';

class RosaryWidget extends StatelessWidget{
  RosaryCatModel rosaryCatModel;
  RosaryWidget(this.rosaryCatModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,x) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),
                border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.brown)
              ),
              child: Container(
                width: double.infinity,
                padding:EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(rosaryCatModel.name.toString(),style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.7),),textAlign: TextAlign.end,),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(rosaryCatModel.count.toString(),style: GoogleFonts.reemKufi(color:SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
                                  SizedBox(width: 5.w,),
                                  Text(':  عدد التكرار',style: GoogleFonts.reemKufi(fontSize: 15.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black.withOpacity(0.7)),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width:10.w ,),
                        Column(
                          children: [
                            Image.asset('assets/pngtree-orange-tasbih-png-image_7503195.png',height: 80.h,width: 80.w,),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap:(){
                              provider.RosaryNameController.text=rosaryCatModel.name??'';
                              provider.RosaryCountController.text=(rosaryCatModel.count).toString();
                              AppRouter.NavigateToWidget(UpdateRosaryScreen(rosaryCatModel));
                            },
                            child: Icon(Icons.edit,color: Colors.brown,)),
                        SizedBox(width: 10.w,),
                        InkWell(
                            onTap: (){
                              provider.deleteRosary(rosaryCatModel);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                                    content: Text('تم حذف التسبيحة',textAlign: TextAlign.center,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                                  ));
                            },
                            child: Icon(Icons.delete,color: Color(0xFF770909),)),
                      ],
                    )
                  ],
                ),
              ),

            ),
            rosaryCatModel.catId==provider.rosaryCatList.last.catId?SizedBox(height: 50.h,):SizedBox()

          ],
        );
      }
    );
  }


}