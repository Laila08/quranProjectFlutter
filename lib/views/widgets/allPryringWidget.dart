import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/views/screens/contentAzkarScreen.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/AzkarCatWidget.dart';
import 'package:quranproject/views/widgets/allPryerAzk.dart';

class AllPryring extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return provider.allPryList.isEmpty ?
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/WhatsApp Image 2022-08-27 at 7.09.18 PM.jpeg'),fit: BoxFit.cover
                )
            ),
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                leftDotColor: SettingScreen.isGreen?Color(0xFF699352): Color(0xFF26262A),
                rightDotColor: SettingScreen.isGreen?Color(0xFF344F24): Color(0xFF645D60),
                size: 100,
              ),
            ),):
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/WhatsApp Image 2022-09-04 at 4.26.47 PM.jpeg'),
                    fit: BoxFit.cover
                )
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:provider.allPryList.length ,
                itemBuilder:(context,index){
                  return AllPryerAzk(index,provider.allPryList);
                }),
          );
        }
    );
  }

}