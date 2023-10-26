import 'package:emp_sys/pages/landingPage.dart';
import 'package:emp_sys/pages/login.dart';
import 'package:emp_sys/pages/testing.dart';
import 'package:emp_sys/pages/timeTrackingData.dart';
import 'package:emp_sys/pages/time_tracking.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:isolated_worker/isolated_worker.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: "AIzaSyCK58s4NYDEVj49-1FDQl7Ac8RIfxPwLlw",
    appId: "1:1035510320142:web:a4576fd8893dc8461a405f",
    messagingSenderId: "1035510320142",
    projectId: "zelleclients",
    storageBucket: "zelleclients.appspot.com",
    authDomain: "zelleclients.firebaseapp.com",
    databaseURL: "https://zelleclients-default-rtdb.firebaseio.com",
  ));



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (context) => Provider1(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              
              home: //time_tracking(),
                  //UserInformation(),

                  //Error404(),
                 LoginPage(),
                 //  LandingPage(),
                  // TimeTrakingReports()
              //AddUser('faraz','zelle',22),
              //LandingPage(),
              //  OopinImagesVerification()
            ),
          );
        });
  }
}
