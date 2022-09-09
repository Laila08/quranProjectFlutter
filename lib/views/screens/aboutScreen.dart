import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photo_2022-08-26_22-27-14.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.brown
            )
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 440),
              child: Text('مناجاة هو تطبيق للمسلم لتلبية جميع احتياجاته اليومية من شعائر وغيرها كقراءة القرآن والتسبيح والكثير من السنن والأحاديث والأذكار لتذكير المسلم دائما باقامة الشعائر الدينية',
                  style: GoogleFonts.reemKufi(fontSize: 30),textAlign: TextAlign.center,),
            ),
          ),
        ),
      ),
    );
  }

}