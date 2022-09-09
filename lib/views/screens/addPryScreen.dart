import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/views/screens/addMyPry.dart';
import 'package:quranproject/views/screens/settingScreen.dart';
import 'package:quranproject/views/widgets/allPryringWidget.dart';

class AddPry extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/qu.jpeg'),fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 40.w,),
              InkWell(
                onTap: (){
                  AppRouter.NavigateToWidget(AddMyPry());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 7),
                  decoration: BoxDecoration(
                    color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    )
                  ),
                  child: Icon(Icons.add,color: Colors.white,),
                ),
              ),
            ],
          ),
          Expanded(child: AllPryring()),
        ],
      ),
    );
  }

}