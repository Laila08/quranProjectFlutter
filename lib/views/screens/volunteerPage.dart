import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranproject/views/screens/settingScreen.dart';

class VolunteerPage extends StatefulWidget{
  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
bool isVisible = false;
bool isVisible1 = false;
bool isVisible2 = false;
bool isVisible3 = false;
bool isVisible4 = false;
bool isVisible5 = false;
bool isVisible6 = false;
bool isVisible7 = false;

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
                  child: _buildContainer('صيام ستة أيام من شهر شوال','1')),
              Visibility(
                  visible:isVisible,
                  child: _buildContainerDet('من أنواع صوم النفل صيام ستة أيام من شهر شوال، وشهر شوال هو الشهر العاشر في ترتيب شهور السنة الهلالية، ويقع بعد شهر رمضان، ويستحب صيام ستة أيام منه سواء كانت متوالية أو متفرقة، باستثناء أول يوم من شوال الذي هو يوم عيد الفطر، فلا يجوز الصيام فيه حيث أنه يحرم صيام يومي العيد الفطر والأضحى. ويدل على استحباب صيام الست من شوال: ما أخرجه مسلم في صحيحه: «عن أبي أيوب الأنصاري رضي الله عنه أنه حدثه أن رسول الله ﷺ قال: "من صام رمضان ثم أتبعه ستا من شوال كان كصيام الدهر"». وفي رواية: «من صام رمضان ثم أتبعه ستا من شوال فكأنما صام الدهر».')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                onTap: (){
                  isVisible1=!isVisible1;
                  setState((){});
                },
                  child: _buildContainer('صوم شهر شعبان','2')),
              Visibility(
                  visible:isVisible1,
                  child: _buildContainerDet('كان النبي (ص) يصوم في شعبان ما لا يصوم في غيره، عن أُسَامَة بْنُ زَيْدٍ قَالَ: قُلْتُ: «يَا رَسُولَ اللهِ، لَمْ أَرَكَ تَصوم شَهْرًا مِنَ الشُّهُورِ مَا تَصوم مِنْ شَعْبَانَ. قَالَ: ذَلِكَ شَهْرٌ يَغْفُلُ النَّاسُ عَنْهُ بَيْنَ رَجَب وَرَمَضَانَ، وَهُوَ شَهْرٌ تُرْفَعُ فِيهِ الأَعْمَالُ إلَى رَبِّ الْعَالَمِينَ، فَأحِبُّ أَنْ يُرْفَعَ عَمَلِي وَأَنَا صَائِمٌ»(رواه النسائي). أما النهي الوارد في حديث النبي (ص) «إِذَا انْتَصَفَ شَعْبَانُ فَلاَ تَصُومُوا حَتَّى رَمَضَانَ»(رواه ابن خزيمة)، فمحمول إما على اختصاص النصف الأخير بالصيام، أو عدم وصل شعبان برمضان، فأما من صام في أوله ولم يخص آخره ولم يصله برمضان، فلا حرج في صيامه.'),),
                    /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible2=!isVisible2;
                    setState((){});
                  },
                  child: _buildContainer('صوم شهر المحرم','3')),
              Visibility(
                visible:isVisible2,
                child: _buildContainerDet('شهر المحرم الحرام مستحب، وهو من أنواع صوم النفل، الذي ثبث في الحديث استحباب صيامه وبيان فضله، فعن أبي هريرة قال: «سئل رسول الله ﷺ، أي الصلاة أفضل بعد المكتوبة؟ قال: «الصلاة في جوف الليل» قيل: ثم أي الصيام أفضل بعد رمضان؟ قال: «شهر الله الذي تدعونه المحرم»». رواه أحمد، ومسلم، وأبو داود. وفي رواية: «عن أبي هريرة قال: سئل رسول الله ﷺ: أي الصلاة أفضل بعد المكتوبة؟ قال: «الصلاة في جوف الليل»، قال: فأي الصيام أفضل بعد رمضان؟ قال: «شهر الله المحرم». رواه الجماعة إلا البخاري ولابن ماجه منه فضل الصوم فقط»')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible3=!isVisible3;
                    setState((){});
                  },
                  child: _buildContainer('صوم عاشوراء','4')),
              Visibility(
                visible:isVisible3,
                child: _buildContainerDet('صوم يوم عاشوراء هو يوم العاشر من المحرم، وهو من الصوم المشروع في الإسلام في مراحل التشريع، فقد كان الناس في الجاهلية يصومونه، ولما هاجر المسلمون إلى المدينة وجدوا اليهود أيضا يصومونه، وقد أمر المسلمون بصيامه، قبل أن يفرض عليهم صوم شهر رمضان، فلما فرض عليهم صوم شهر رمضان، لم يبق طلب الإتيان به شرعا كما كان في السابق، وهو بعد فرض صوم رمضان مستحب بإجماع أهل العلم. وفي الحديث: «عن ابن عمر رضى الله تعالى عنهما قال صام النبي ﷺ عاشوراء وأمر بصيامه، فلما فرض رمضان ترك وكان عبد الله لا يصومه إلا أن يوافق صومه». و«عن عائشة رضى الله تعالى عنها أن قريشا كانت تصوم يوم عاشوراء في الجاهلية ثم أمر رسول الله ﷺ بصيامه حتى فرض رمضان، وقال رسول الله ﷺ: من شاء فليصمه ومن شاء أفطر».')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible4=!isVisible4;
                    setState((){});
                  },
                  child: _buildContainer('صوم الإثنين والخميس','5')),
              Visibility(
                visible:isVisible4,
                child: _buildContainerDet('من أنواع صوم النفل صوم يومي الإثنين والخميس، وهو الصوم المستحب في الأسبوع، وهو أن يتحرى مريد التطوع بالصوم الصيام في كل اثنين وخميس من الأسبوع، وفي الحديث: عن عائشة قالت: «إن النبي ﷺ كان يتحرى صيام الإثنين والخميس». وثبت في مشروعية استحباب صيامهما دليل الترغيب وهو أن يومي الإثنين والخميس تعرض فيهما الأعمال، ووجه ذلك: أن الصوم عمل فيستحب للمسلم الصوم فيهما ليعرض عمله وهو صائم، ويدل على هذا حديث: عن أبي هريرة: «أن النبي ﷺ قال: «تعرض الأعمال كل إثنين وخميس فأحب أن يعرض عملي وأنا صائم»». كما ورد أيضا في صوم يوم الإثنين حديث: عن أبي قتادة: «أن النبي ﷺ سئل عن صوم يوم الإثنين فقال: «ذلك يوم ولدت فيه، وأنزل علي فيه»». وفي هذا دليل استحباب صوم يومي الإثنين والخميس؛ لأنهما يومان تعرض فيهما الأعمال، وقوله في الحديث: قال: «ذلك يوم ولدت فيه وأنزل علي فيه»، ويوم الإثنين هو اليوم الذي كانت ولادته فيه، وهو أيضا اليوم الذي أنزل الله فيه عليه الوحي')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible5=!isVisible5;
                    setState((){});
                  },
                  child: _buildContainer('صوم ثلاثة أيام من كل شهر','6')),
              Visibility(
                visible:isVisible5,
                child: _buildContainerDet('من الصوم المستحب صوم ثلاثة أيام من كل شهر، ويدل عليه حديث: «عن أبي هريرة رضي الله عنه قال: أوصاني خليلي ﷺ بثلاث: صيام ثلاثة أيام من كل شهر، وركعتي الضحى، وأن أوتر قبل أن أنام». قال ابن دقيق العيد: فيه دليل على تأكيد هذه الأمور بالقصد إلى الوصية بها، وصيام ثلاثة أيام قد وردت علته في الحديث، وهو تحصيل أجر الشهر، باعتبار أن الحسنة بعشر أمثالها، وقد ذكرنا ما فيه، ورأى من يرى أن ذلك أجر بلا تضعيف، ليحصل الفرق بين صوم الشهر تقديرا، وبين صومه تحقيقا. وفي الحديث دليل على استحباب صيام ثلاثة أيام من كل شهر، واستحباب صلاة الضحى. وعن أبي ذر قال: «أمرنا رسول الله ﷺ أن نصوم من الشهر ثلاثة أيام البيض: ثلاث عشرة وأربع عشرة وخمس عشرة»')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible6=!isVisible6;
                    setState((){});
                  },
                  child: _buildContainer(' صوم يوم وإفطار يوم','7')),
              Visibility(
                visible:isVisible6,
                child: _buildContainerDet('من أنواع صوم النفل صوم يوم وإفطار يوم، ويسمى صوم نبي الله داود عليه الصلاة والسلام ، وهو مستحب لمن يريد التطوع بالصوم في جميع أيام العام، باستثناء صوم شهر رمضان، والأيام المنهي عن صومها، وهذا النوع من الصوم لمن رغب في المزيد من التنفل بالصوم ووجد في نفسه قدرة عليه من غير تضييع الحقوق والواجبات، وأما الزيادة على هذا فهو منهي عنه. ويدل على هذا حديث: «عن عبد الله بن عمرو رضي الله عنهما عن النبي ﷺ قال: صم من الشهر ثلاثة أيام قال: أطيق أكثر من ذلك، فما زال حتى قال: صم يوما وأفطر يوما، فقال: اقرء القرآن في كل شهر، قال إني أطيق أكثر فما زال حتى قال في ثلاث». وعن أبي سلمة بن عبد الرحمن، عن عبد الله بن عمرو قال، «قال لي رسول الله ﷺ: «لقد أخبرت أنك تقوم الليل وتصوم النهار» قال: قلت: يا رسول الله نعم، قال: «فصم، وافطر وصل ونم، فإن لجسدك عليك حقا، وإن لزوجك عليك حقا، وإن لزورك عليك حقا، وإن بحسبك أن تصوم من كل شهر ثلاثة أيام» قال: فشددت فشدد علي قال: فقلت، يا رسول الله إني أجده قوة قال: «فصم من كل جمعة ثلاثة أيام» قال: فشددت فشدد علي قال فقلت: يا رسول الله إني أجد قوة قال: «صم صوم نبي الله داود، ولا تزد عليه» قلت: يا رسول الله وما كان صيام داود عليه الصلاة والسلام؟ قال: «كان يصوم يوما، ويفطر يوما»». و«عن عبد الله بن عمرو بن العاص قال: قال رسول الله ﷺ: إن أحب الصيام إلى الله صيام داود، وأحب الصلاة إلى الله صلاة داود، كان ينام نصف الليل ويقوم ثلثه وينام سدسه، وكان يصوم يوما ويفطر يوما».')),
              /////////////////////////////////////////////////////////////////////////////////////
              InkWell(
                  onTap: (){
                    isVisible7=!isVisible7;
                    setState((){});
                  },
                  child: _buildContainer('صوم تسعة أيام من أول ذي الحجة','8')),
              Visibility(
                visible:isVisible7,
                child: _buildContainerDet('لقول النبي (ص): «مَا مِنْ أَيَّام الْعَمَلُ الصَّالِحُ فِيهَا أَحَبُّ إِلَى اللهِ مِنْ هَذِهِ الأَيَّامِ- يَعْنِي أَيَّامَ الْعَشْرِ- قَالُوا: يَا رَسُولَ اللهِ، وَلَا الْجِهَادُ فِي سَبِيلِ اللهِ؟ قَالَ:«وَلَا الْجِهَادُ فِي سَبِيلِ اللهِ، إِلَّا رَجُلٌ خَرَجَ بِنَفْسِهِ وَمَالِهِ، فَلَمْ يَرْجِعْ مِنْ ذَلِكَ بِشَيْءٍ»(رواه البخاري)، ويسن الاجتهاد فيها بالعبادة، من الذكر والتهليل وقراءة القرآن والصدقة، وصيامها ما عدا يوم العيد، وآكد هذه الأيام يوم عرفة لغير الحاج -وهو اليوم التاسع من ذي الحجة-؛ لقَول النبي (ص): «صِيَامُ يَوْمِ عَرَفَةَ أَحْتَسِبُ عَلَى اللهِ أَنْ يُكَفِّرَ السَّنَةَ التي قَبْلَهُ، وَالسَّنَةَ التي بَعْدَهُ» (رواه مسلم).')),
              /////////////////////////////////////////////////////////////////////////////////////

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