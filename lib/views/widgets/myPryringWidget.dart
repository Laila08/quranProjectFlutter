import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/model/ayah_model.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/provider/quran_provider.dart';
import 'package:quranproject/views/widgets/ayahWidget.dart';
import 'package:quranproject/views/widgets/myPryAzk.dart';
import 'package:quranproject/views/widgets/surahWidget.dart';

class MyPryringWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return provider.pryCatList.isEmpty ?
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
                leftDotColor: const Color(0xFF26262A),
                rightDotColor: const Color(0xFF645D60),
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
                itemCount:provider.pryCatList.length ,
                itemBuilder:(context,index){
                  return MyPryerAzk(index,provider.pryCatList);
                }),
          );
        }
    );
  }

}









