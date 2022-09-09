import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class ObligatoryFast extends StatefulWidget{
  @override
  State<ObligatoryFast> createState() => _ObligatoryFastState();
}

class _ObligatoryFastState extends State<ObligatoryFast> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/done.jpeg'),fit: BoxFit.cover
            )
        ),
        child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                    onTap: (){
                      isVisible=!isVisible;
                      setState((){});
                    },
                    child: _buildContainer('صوم رمضان','1')),
                Visibility(
                    visible:isVisible,
                    child: _buildContainerDet('صوم شهر رمضان من كل عام هو الصوم المفروض على المسلمين، بالإجماع، وهو أحد أركان الإسلام الخمسة، وأفضل أنواع الصوم؛ للحديث القدسي بلفظ: «وما تقرب إلي عبدي بشيء أحب إلي مما فرضت عليه»، حيث أن أداء الفرائض أحب الأعمال إلى الله. وفرض في السنة الثانية من الهجرة النبوية، قال البهوتي: «فرض في السنة الثانية من الهجرة، إجماعا، فصام النبي ﷺ: تسع رمضانات إجماعا». والأصل في وجوب صومه: ﴿يَا أَيُّهَا الَّذِينَ ءآمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ..﴾ الآية ثم تعين صوم شهر رمضان بآية: ﴿فَمَن شَهِدَ مِنكُمُ الشَّهْرَ فَلْيَصُمْهُ﴾ وحديث: «بني الإسلام على خمس». وذكر منها: «صوم رمضان». ويجب صوم شهر رمضان إما برؤية الهلال، أو باستكمال شهر شعبان ثلاثين يوما عند تعذر رؤية هلال رمضان. ويجب على كل مسلم، مكلف بالغ عاقل، مطيق للصوم، صحيح، مقيم، غير معذور. ولا يصح إلا من مسلم، كما يشترط لصحته شروط منها: نقاء المرأة من الحيض والنفاس. ويختص صوم رمضان بخصوصية فضيلة الوقت من طلوع الفجر الثاني، إلى غروب الشمس. وصوم رمضان يكفر الذنوب لمن صامه إيمانا واحتسابا')),
                /////////////////////////////////////////////////////////////////////////////////////
                InkWell(
                    onTap: (){
                      isVisible1=!isVisible1;
                      setState((){});
                    },
                    child: _buildContainer('صوم النذر','2')),
                Visibility(
                  visible:isVisible1,
                  child: _buildContainerDet('نَذْرُ الصوم هو ما أوجبه المكلف على نفسه من صيام ، وقد عدَّ الله تعالى الوفاء به من صفات الأبرار. فإذا نذر الإنسان صوم أيام معدودة لزمه أن يوفي بما نذر. قال الله تعالى: في سورة الإنسان: Ra bracket.png يُوفُونَ بِالنَّذْرِ وَيَخَافُونَ يَوْمًا كَانَ شَرُّهُ مُسْتَطِيرًا Aya-7.png La bracket.png  وفي صحيح البخاري عن عائشة رضي الله عنها أن رسول الله ﷺ قال: «من نذر أن يطيع اللّه فليطعه، ومن نذر أن يعصي اللّه فلا يعصه».')),
                /////////////////////////////////////////////////////////////////////////////////////
                InkWell(
                    onTap: (){
                      isVisible2=!isVisible2;
                      setState((){});
                    },
                    child: _buildContainer('كفارة اليمين','3')),
                Visibility(
                    visible:isVisible2,
                    child: _buildContainerDet('مأخوذة من الكفر، وهو الستر والتغطية، وسميت بذلك؛ لأنها تغطي الإثم وتستره، ومن ذلك قوله الله تعالى في: سورة الأنفال: يَا أَيُّهَا الَّذِينَ آمَنُوا إِنْ تَتَّقُوا اللَّهَ يَجْعَلْ لَكُمْ فُرْقَانًا وَيُكَفِّرْ عَنْكُمْ سَيِّئَاتِكُمْ وَيَغْفِرْ لَكُمْ وَاللَّهُ ذُو الْفَضْلِ الْعَظِيمِ Aya-29.png La bracket.png. ، ومن ذلك قوله تعالى : في سورة الحديد Ra bracket.png اعْلَمُوا أَنَّمَا الْحَيَاةُ الدُّنْيَا لَعِبٌ وَلَهْوٌ وَزِينَةٌ وَتَفَاخُرٌ بَيْنَكُمْ وَتَكَاثُرٌ فِي الْأَمْوَالِ وَالْأَوْلَادِ كَمَثَلِ غَيْثٍ أَعْجَبَ الْكُفَّارَ نَبَاتُهُ ثُمَّ يَهِيجُ فَتَرَاهُ مُصْفَرًّا ثُمَّ يَكُونُ حُطَامًا وَفِي الْآخِرَةِ عَذَابٌ شَدِيدٌ وَمَغْفِرَةٌ مِنَ اللَّهِ وَرِضْوَانٌ وَمَا الْحَيَاةُ الدُّنْيَا إِلَّا مَتَاعُ الْغُرُورِ ')),
                /////////////////////////////////////////////////////////////////////////////////////
                InkWell(
                    onTap: (){
                      isVisible3=!isVisible3;
                      setState((){});
                    },
                    child: _buildContainer('كفارة القتل','4')),
                Visibility(
                    visible:isVisible3,
                    child: _buildContainerDet('كفارة القتل هي أحد الكفارات الخمسة المعهودة في الشرع، وهي واجبة، فالكفارة في عُرف الشرع اسم للواجب، وقد عُرف وجوب كفارة القتل من القرآن الكريم لقوله تعالى في سورة النساء: وَمَا كَانَ لِمُؤْمِنٍ أَنْ يَقْتُلَ مُؤْمِنًا إِلَّا خَطَأً وَمَنْ قَتَلَ مُؤْمِنًا خَطَأً فَتَحْرِيرُ رَقَبَةٍ مُؤْمِنَةٍ وَدِيَةٌ مُسَلَّمَةٌ إِلَى أَهْلِهِ إِلَّا أَنْ يَصَّدَّقُوا فَإِنْ كَانَ مِنْ قَوْمٍ عَدُوٍّ لَكُمْ وَهُوَ مُؤْمِنٌ فَتَحْرِيرُ رَقَبَةٍ مُؤْمِنَةٍ وَإِنْ كَانَ مِنْ قَوْمٍ بَيْنَكُمْ وَبَيْنَهُمْ مِيثَاقٌ فَدِيَةٌ مُسَلَّمَةٌ إِلَى أَهْلِهِ وَتَحْرِيرُ رَقَبَةٍ مُؤْمِنَةٍ فَمَنْ لَمْ يَجِدْ فَصِيَامُ شَهْرَيْنِ مُتَتَابِعَيْنِ تَوْبَةً مِنَ اللَّهِ وَكَانَ اللَّهُ عَلِيمًا حَكِيمًا')),
                /////////////////////////////////////////////////////////////////////////////////////
                InkWell(
                    onTap: (){
                      isVisible4=!isVisible4;
                      setState((){});
                    },
                    child: _buildContainer('كفارة الظهار','5')),
                Visibility(
                    visible:isVisible4,
                    child: _buildContainerDet('الظهار هو: أن يشبِّه الرجل زوجته بامرأة محرمة عليه على التأبيد أو بجزء منها يحرم عليه النظر إليه كالظهر أو البطن أو الفخذ. كأن يقول لزوجته: أنتِ علي كأمي، أو أختي، أو بنتي ونحو ذلك. أو يقول: أنتِ علي كظهر أمي، أو كبطن أختي، أو كفخذ بنتي ونحو ذلك. أو يقول: أنتِ علي حرام كظهر أمي، أو كأمي، أو كبنتي ونحو ذلك. فإذا قال لها ذلك ولم يتبعه بالطلاق؛ صار عائدا، ولزمته الكفارة بهذا العود.')),

                SizedBox(height: 20.h,)
              ],
            )
        )
    );
  }
}
Widget _buildContainer (String text,String number){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/photo_2022-08-26_22-27-11.jpg'),
            fit: BoxFit.cover
        )
    ),
    child: Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(text,style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
            SizedBox(width: 5.w,),
            Text('-',style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
            SizedBox(width: 3.w,),
            Text(number,style: GoogleFonts.reemKufi(fontSize: 22.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
          ],
        ),
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اضغط للمزيد',style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12.sp),),
            Icon(Icons.touch_app_sharp,color: Colors.black.withOpacity(0.6),size: 15,),
            SizedBox(width: 70.w,)
          ],
        ),
      ],
    ),
  );
}
Widget _buildContainerDet (String text){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
    margin: EdgeInsets.only(left: 20,right: 20,top: 20),
    decoration: BoxDecoration(
        border: Border.all(color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/2.jpeg'),
            fit: BoxFit.cover
        )
    ),
    child: Text(text,textAlign: TextAlign.end,style: GoogleFonts.reemKufi(fontSize: 20.sp,color: SettingScreen.isGreen?Color(0xFF344F24):Colors.black),),
  );
}