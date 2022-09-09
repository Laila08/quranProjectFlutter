import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/data/sp_helper.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/RosaryDesc.dart';
import 'package:quranproject/views/screens/addRosaryScreen.dart';
import 'package:quranproject/views/screens/screen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/RosaryWidget.dart';

class RosaryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Consumer<FireStoreProvider>(
       builder: (context,provider,x) {
         return Scaffold(
           appBar: AppBar(
             backgroundColor:SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
             title: Text('السبحة',style: GoogleFonts.reemKufi(fontSize: 30.sp),),
             centerTitle: true,
             leading: Row(
               children: [
                 SizedBox(width: 30.w,),
                 InkWell(
                     onTap: (){
                       AppRouter.NavigateToWidget(Screen());
                     },
                     child: Icon(Icons.arrow_back_ios)),
               ],
             ),
           ),
           body:provider.azkarCatList.isEmpty ?
           Container(
             height: double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
                 image: DecorationImage(
                     image: AssetImage('assets/photo_2022-08-26_22-27-13.jpg'),fit: BoxFit.cover
                 )
             ),
             child: Center(
               child: LoadingAnimationWidget.twistingDots(
                 leftDotColor: const Color(0xFF26262A),
                 rightDotColor: const Color(0xFF645D60),
                 size: 100,
               ),
             ),):Container(
             height: double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/photo_2022-08-26_22-27-13.jpg'),
                 fit: BoxFit.cover
               )
             ),
             child: ListView.builder(
               itemCount:provider.rosaryCatList.length ,
               itemBuilder:(context,index) {
                 return InkWell(
                     onTap: (){
                       AppRouter.NavigateToWidget(RosaryDesc(provider.rosaryCatList[index]));
                     },
                     child: RosaryWidget(provider.rosaryCatList[index]));
               }
             ),
           ),
           floatingActionButton: FloatingActionButton.extended(
             splashColor: Colors.black.withOpacity(0.5),
             label: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Row(children: [
                 Text('اضافة تسبيحة',style: GoogleFonts.reemKufi(fontSize: 20.sp),),
                 Icon(Icons.add),
               ],),
             ),
             onPressed: (){
               AppRouter.NavigateToWidget(AddRosaryScreen());
             },
             backgroundColor:SettingScreen.isGreen?Color(0xFF344F24): Colors.black,
           ),
           floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         );
       }
     );
  }

}