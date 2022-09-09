import 'package:flutter/material.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/views/screens/screen.dart';

class SplachScreen extends StatelessWidget{
  initFun() async{
    await Future.delayed(Duration(seconds: 2));
    AppRouter.NavigateWithReplacemtnToWidget(Screen());
  }
  @override
  Widget build(BuildContext context)  {
    initFun();
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo_2022-08-26_21-36-36.jpg'),
            fit: BoxFit.cover
          )
        ),
      ) ,
    );
  }

}