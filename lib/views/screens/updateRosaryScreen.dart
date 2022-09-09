import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/model/rosaryChat.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/rosaryScreen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/custom_form.dart';

class UpdateRosaryScreen extends StatelessWidget{
  RosaryCatModel rosaryCatModel;
  UpdateRosaryScreen(this.rosaryCatModel);
  GlobalKey<FormState> rosaryKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading:Row(
                children: [
                  SizedBox(width: 5.w,),
                  IconButton(onPressed: (){
                    if(rosaryKey.currentState!.validate()){
                      provider.updateRosary(rosaryCatModel);
                      AppRouter.NavigateToWidget(RosaryScreen());
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                            content: Text('تم تعديل التسبيحة',textAlign: TextAlign.center,style: GoogleFonts.reemKufi(fontSize: 20.sp)),
                          ));
                    }
                  }, icon: Icon(Icons.done,size: 40,color: Colors.green,)),
                ],
              ),
              title: Text('تعديل',style: GoogleFonts.reemKufi(fontSize: 25.sp),),
              centerTitle: true,
              actions: [
                IconButton(onPressed: (){
                  AppRouter.NavigateToWidget(RosaryScreen());
                }, icon: Icon(Icons.close,size: 37,color: Colors.red,)),
                SizedBox(width: 10.w,),
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/rooo.jpeg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Form(
                key: rosaryKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 120.h,),
                      CustomField(textInputType:TextInputType.name ,hint:'عنوان التسبيحة',validator:provider.validateNull ,controller:provider.RosaryNameController ,),
                      SizedBox(height: 50.h,),
                      CustomField(textInputType:TextInputType.number ,hint:'مرات التكرار',validator:provider.validateCount ,controller:provider.RosaryCountController ,)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

}