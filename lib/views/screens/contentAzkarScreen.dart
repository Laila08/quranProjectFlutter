
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/model/azkarCat.dart';
import 'package:quranproject/model/contentAzkarModel.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/contentAzkarWidget.dart';

class ContentAzkarScreen extends StatelessWidget {
  AzkarCatModel azkarCatModel;
  String catId;
  ContentAzkarScreen(this.catId,this.azkarCatModel);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
            title: Text(azkarCatModel.name??'',style:  GoogleFonts.reemKufi(fontSize: 25.sp),),
          ),
          body:  provider.contentAzkarList.isEmpty ?
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
                        leftDotColor: SettingScreen.isGreen?Color(0xFF7DAD63): Color(0xFF26262A),
                        rightDotColor: SettingScreen.isGreen?Color(0xFF344F24): Color(0xFF645D60),
                        size: 100,
                      ),
                    ),)
                    :
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/photo_2022-08-26_22-27-12.jpg'),fit: BoxFit.cover
                    )
                  ),
                  child: ListView.builder(
                    itemCount: provider.contentAzkarList!.length,
                    itemBuilder: (context, index) {
                      return ContentAzkarWidget(provider.contentAzkarList![index],catId);
                    },
                  ),
                )
        );
      }
    );
  }
}