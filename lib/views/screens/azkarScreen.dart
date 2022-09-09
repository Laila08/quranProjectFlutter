import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/views/screens/contentAzkarScreen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/AzkarCatWidget.dart';

class AzkarScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
        title: Text('الأذكار',style: GoogleFonts.reemKufi(fontSize: 25.sp),),
      ),
      body:Consumer<FireStoreProvider>(
        builder: (context,provider,x){
          return provider.azkarCatList.isEmpty ?
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/photo_2022-08-26_22-27-12.jpg'),fit: BoxFit.cover
                )
            ),
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor:SettingScreen.isGreen?Color(0xFF344F24):Color(0xFF26262A),
                rightDotColor:SettingScreen.isGreen?Color(0xFF344F24):Color(0xFF645D60),
                size: 100,
              ),
            ),):
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/WhatsApp Image 2022-08-29 at 5.01.16 PM.jpeg'),fit: BoxFit.cover
              )
            ),
            child: ListView.builder(
              itemCount: provider.azkarCatList.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    provider.getAllProduct(provider.azkarCatList[index].catId!);
                    AppRouter.NavigateToWidget(ContentAzkarScreen(provider.azkarCatList![index].catId!,provider.azkarCatList[index]));                  },
                    child: AzkarCatWidget(provider.azkarCatList[index]));
              }),
          );
        },
      ) ,
    );
  }

}