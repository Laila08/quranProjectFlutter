import 'package:adhan/adhan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/appRouter.dart';
import 'package:quranproject/data/sp_helper.dart';
import 'package:quranproject/firebase_options.dart';
import 'package:quranproject/myMap.dart';
import 'package:quranproject/provider/fireStoreProvider.dart';
import 'package:quranproject/provider/quran_provider.dart';
import 'package:quranproject/views/screens/AllahNameScreen.dart';
import 'package:quranproject/views/screens/addRosaryScreen.dart';
import 'package:quranproject/views/screens/fasfScreen.dart';
import 'package:quranproject/views/screens/pryringScreen.dart';
import 'package:quranproject/views/screens/pryringTimeScreen.dart';
import 'package:quranproject/views/screens/rosaryScreen.dart';
import 'package:quranproject/views/screens/screen.dart';
import 'package:quranproject/views/screens/splachScreen.dart';
import 'package:quranproject/views/screens/surahScreen.dart';
import 'package:quranproject/views/screens/volunteerPage.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSp();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  // Coordinates coordinates = Coordinates(31.5000,  34.4667);
  // DateComponents dateTime = DateComponents.from(DateTime.now());
  // CalculationParameters calculationParameters = CalculationMethod.muslim_world_league.getParameters();
  // PrayerTimes prayerTimes = PrayerTimes(coordinates,dateTime,calculationParameters,);
  // print('${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}' );
  // print('My Prayer Times');
  // final myCoordinates = Coordinates(23.9088, 89.1220); // Replace with your own location lat, lng.
  // final params = CalculationMethod.karachi.getParameters();
  // params.madhab = Madhab.hanafi;
  // final prayerTimes = PrayerTimes.today(myCoordinates, params);
  //
  // print("---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
  // print(DateFormat.jm().format(prayerTimes.fajr));
  // print(DateFormat.jm().format(prayerTimes.sunrise));
  // print(DateFormat.jm().format(prayerTimes.dhuhr));
  // print(DateFormat.jm().format(prayerTimes.asr));
  // print(DateFormat.jm().format(prayerTimes.maghrib));
  // print(DateFormat.jm().format(prayerTimes.isha));
  //
  // print('---');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<QuranProvider>(
            create:(context){
              return QuranProvider();
            }
        ),
        ChangeNotifierProvider<FireStoreProvider>(
            create:(context){
              return FireStoreProvider();
            }
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(411.42857142857144, 876.5714285714286),
          minTextAdapt: true,
          splitScreenMode: true,
        builder: (context,child) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            debugShowCheckedModeBanner: false,
            home: SplachScreen(),
          );
        }
      ),
    );
  }
}
