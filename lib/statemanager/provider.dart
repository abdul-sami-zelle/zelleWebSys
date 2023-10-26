import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emp_sys/pages/profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'dart:html';
import 'dart:ui';
import 'package:http/http.dart' show get;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import '../pages/landingPage.dart';

// import 'dart:js' as js;
// import 'package:firebase_auth_web/firebase_auth_web.dart';

class Provider1 extends ChangeNotifier {
  var dataExist;
  String? name_;
  String? age_;
  String? email_;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? uid;
  String? shift_;
  String? empId_;
  String? hours_;
  String? in_;
  String? out_;
  String? profile_;
  String? profileA_;
  String? emailA_;
  String? userEmail;
  String? histShiftStart;

  String? designation_;

  String? db_name;

  ResetPassword(String email) async {
    await Firebase.initializeApp();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  DateTime checkDateTime() {
    DateTime now = DateTime.now();
    if ((now.hour >= 0 && now.hour < 11) && (shift_ == 'Night')) {
      // If the time is after 12 AM and before 6 AM, return yesterday's date
      return now.subtract(Duration(days: 1));
    } else {
      // Otherwise, return today's date
      return now;
    }
  }

  String? currentMonth;
  String? currentDate;




  // testingFn(){
  //   DateTime now = DateTime(2023,10,2);
  //   DateTime previousMonth = DateTime(now.year, now.month - 1, now.day);
     
      
      
  //     print(currentDate);
  //     print(currentMonth);
  // }





  getCurrentMonthDate(){
    DateTime now = DateTime.now();
    DateTime previousMonth = DateTime(now.year, now.month - 1, now.day);
    if((now.hour >= 0 && now.hour < 11) && (shift_ == 'Night')) {

    if (now.day==1) {
         currentDate = DateFormat('d-M-yyyy').format(now.subtract(Duration(days: 1))); 
           if (previousMonth.month == 0) {
              // If the previous month was January, adjust the year as well
              previousMonth = DateTime(now.year - 1, 12, now.day);
              currentMonth = DateFormat('MMMM yyyy').format(previousMonth);
            }
            else{
              currentMonth = DateFormat('MMMM yyyy').format(previousMonth);
            }
      } else {
         currentDate = DateFormat('d-M-yyyy').format(now.subtract(Duration(days: 1))); 
         currentMonth = DateFormat('MMMM yyyy').format(now);
      }
      
      print(currentMonth);
      print(currentDate);
    }else {
      currentMonth = DateFormat('MMMM yyyy').format(now);
      currentDate = DateFormat('d-M-yyyy').format(now);
      print(currentMonth);
    }
  }

  bool loginState = false;

  changeStateTrue() {
    loginState = true;
    notifyListeners();
  }

  changeStateFalse() {
    loginState = false;
    notifyListeners();
  }


   List<Meeting> list = [

   ];

   int? func1(String val){
      return int.parse(val);
   }

   addDates() async{
     await FirebaseFirestore.instance
            .collection('weeklyOffs')
            .doc("2dCXtkkraFST33jeRvgG4WWkT9i2")
            .get().then((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists) {
                      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                      print(data['offs']);
                      for (var i = 0; i < data['offs'].length; i++) {
                        list.add(
                          Meeting(
                            eventName: "off", 
                            from: DateTime(func1(data['offs'][i]['year'].toString())!,func1(data['offs'][i]['month'].toString())!,func1(data['offs'][i]['day'].toString())!), 
                            to: DateTime(func1(data['offs'][i]['year'].toString())!,func1(data['offs'][i]['month'].toString())!,func1(data['offs'][i]['day'].toString())!),
                            ));
                          
                      }

                  } else {
                    print("object");
                  }
            });
   }

  Future<User?> signInWithEmailPassword(
      String email, String password, BuildContext context) async {
    await Firebase.initializeApp();
    User? user;

    try {
      await changeStateTrue();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      if (user != null) {
        
        await getCurrentMonthDate();
        await addDates();
        await FirebaseFirestore.instance
            .collection('Employes')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            Map<String, dynamic> data =
                documentSnapshot.data() as Map<String, dynamic>;
            uid = user!.uid;
            name_ = data['name'];
            hours_ = data['hours'];
            empId_ = data['empID'];
            designation_ = data['designation'];
            in_ = data['in'];
            out_ = data['out'];
            profile_ = data['profile'];
            profileA_ = data['aProfile'] == ""
                ? "https://res.cloudinary.com/diecwxxmm/image/upload/v1697383258/zellesolutions%20portal/pcqabxada1qmx2bzo0vk.jpg"
                : data['aProfile'];
            emailA_ = data['email'];
            shift_ = data['shift'];
            db_name = data['shift'] == 'Day' ? 'morning_Shift' : 'night_Shift';

            print(currentMonth);
            print(currentDate);
             yesterdayDateData();
             lastStats(yesterDay_month!, yesterDay_date!,
            );
            FirebaseFirestore.instance
                .collection('timeTracking')
                .doc(currentMonth)
                .collection(shift_!)
                .doc("${currentDate}")
                .collection("$uid")
                .doc("$uid")
                .get()
                .then((DocumentSnapshot documentSnapshot) async {
              if (documentSnapshot.exists) {
               await doesCollectionExist();
              } else {
                // checking either month exists or not
                FirebaseFirestore.instance
                    .collection('timeTracking')
                    .doc(currentMonth)
                    .get()
                    .then((DocumentSnapshot documentSnapshot) async {
                  if (documentSnapshot.exists) {
                    
                  } else {
                    print("month not exists");
                    FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection('Day')
                        .doc(currentDate);
                    FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection('Night')
                        .doc(currentDate)
                        .set({});
                  }
                });

                // checking date exists or not

                FirebaseFirestore.instance
                    .collection('timeTracking')
                    .doc(currentMonth)
                    .collection(shift_!)
                    .doc("${currentDate}")
                    .get()
                    .then((DocumentSnapshot documentSnapshot) async {
                  if (documentSnapshot.exists) {
                    print('${documentSnapshot.id} document exists');
                  } else {
                    print("date not  exists");
                    FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .set({});
                  }
                });

                // checking uid  exists or not

                FirebaseFirestore.instance
                    .collection('timeTracking')
                    .doc(currentMonth)
                    .collection(shift_!)
                    .doc("${currentDate}")
                    .collection(uid!)
                    .doc(uid!)
                    .get()
                    .then((DocumentSnapshot documentSnapshot) async {
                  if (documentSnapshot.exists) {
                    print('${documentSnapshot.id} collection exists');

                    FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
                        .get()
                        .then((DocumentSnapshot documentSnapshot) async {
                      Map<String, dynamic> data =
                          documentSnapshot.data() as Map<String, dynamic>;
                      print(data['active']);
                    });
                  } else {
                    print("collection not  exists");
                    FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
                        .set({
                      'startShift': "",
                      'endShift': "",
                      "namazBreak": [],
                      "lunchBreak": [],
                      "casualBreak": [],
                      "summitBreak": [],
                      "callBreak": [],
                      'reason': "",
                      "active": "",
                      "activeStartTime": ""
                    });
                  }
                });
              }
            });




            // FirebaseFirestore.instance
            //     .collection('$db_name')
            //     .doc(user.uid)
            //     .collection(checkDateTime().toString().substring(0, 10))
            //     .doc(user.uid)
            //     .get()
            //     .then((DocumentSnapshot documentSnapshot) async {
            //   if (documentSnapshot.exists) {
            //     await doesCollectionExist();
            //   } else {
            //     await addemployeeData();
            //   }
            // });

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage()));
          } else {
            print('Document does not exist on the database');
          }
        });
        uid = user.uid;
        userEmail = user.email;
        print(uid);
        await changeStateFalse();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
      await changeStateFalse();
    }

    return user;
  }

  // Future<void> addemployeeData() async {
  //   notifyListeners();
  //   final collectionName = checkDateTime().toString().substring(0, 10);
  //   final collectionReference = FirebaseFirestore.instance
  //       .collection('$db_name')
  //       .doc(uid)
  //       .collection(collectionName);

  //   // Check if the collection exists
  //   final collectionSnapshot = await collectionReference.get();

  //   if (collectionSnapshot.docs.isEmpty) {
  //     // Collection doesn't exist, create a new
  //     await yesterdayDateData();
  //     await lastStats(
  //         yesterDay_month!, shift_.toString(), yesterDay_date!, uid!, db_name!);
  //     return collectionReference.doc(uid).set({
  //       'startShift': "",
  //       'endShift': "",
  //       "namazBreak": [],
  //       "lunchBreak": [],
  //       "casualBreak": [],
  //       "summitBreak": [],
  //       "callBreak": [],
  //       'reason': "",
  //       "active": "",
  //       "activeStartTime": ""
  //     });
  //   } else {
  //     // Collection exists, update it
  //     // return collectionReference.doc(uid).update({
  //     //   'startShift': DateTime.now().toString(),
  //     //}
  //     //);
  //   }
  // }

  Future<void> endShiftDataBase() {
    notifyListeners();
    return  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      'endShift': DateTime.now().toString(),
    });
  }

  Future<void> endShiftDataBaseEarly(String reason) {
    arrivalButtonsEnability = false;
    notifyListeners();
    return  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({'endShift': DateTime.now().toString(), 'reason': reason});
  }

  Future<void> setStartShiftDb() {
    notifyListeners();
    return  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      'startShift': DateTime.now().toString(),
    });
  }

  var lastList = [];

  String findTimeDifference(String startTime, String endTime) {
    // Define a time format pattern to parse the time strings
    final timeFormat = DateFormat("HH:mm:ss");

    try {
      // Trim the input strings to remove leading and trailing spaces
      startTime = startTime.trim();
      endTime = endTime.trim();

      // Parse the time strings into DateTime objects
      final start = timeFormat.parse(startTime);
      final end = timeFormat.parse(endTime);

      // Calculate the time difference
      final difference = end.difference(start);

      // Convert the duration to a string in "HH:mm:ss" format
      final durationFormatted =
          "${difference.inHours}:${difference.inMinutes.remainder(60).toString().padLeft(2, '0')}:${difference.inSeconds.remainder(60).toString().padLeft(2, '0')}";

      return durationFormatted;
    } catch (e) {
      // Handle any parsing errors here
      print("Error parsing time: $e");
      return ""; // Return an empty string in case of an error
    }
  }

  String? statusCategorization2(String dailyArrival) {
    String arrivalCategory = categorizeArrival2(in_!, dailyArrival);
    return arrivalCategory;
  }

  String categorizeArrival2(String actualArrivalTime, String dailyArrival) {
    // Parse the actual and daily arrival times
    DateFormat format = DateFormat("hh:mm:ss a");
    DateTime actualTime = format.parse(actualArrivalTime);

    // Extract hours, minutes, and seconds from the daily arrival
    List<String> dailyArrivalParts = dailyArrival.split(":");
    int dailyHours = int.parse(dailyArrivalParts[0]);
    int dailyMinutes = int.parse(dailyArrivalParts[1]);
    int dailySeconds = int.parse(dailyArrivalParts[2]);

    // Create a DateTime object for the daily arrival time
    DateTime dailyTime = DateTime(
      actualTime.year,
      actualTime.month,
      actualTime.day,
      dailyHours,
      dailyMinutes,
      dailySeconds,
    );

    // Define a threshold of 15 minutes
    Duration lateThreshold = Duration(minutes: 15);

    // Calculate the time difference
    Duration timeDifference = dailyTime.difference(actualTime);

    if (timeDifference > lateThreshold) {
      return "late";
    } else if (timeDifference <= lateThreshold &&
        timeDifference > Duration(minutes: 0, hours: 0, seconds: 0)) {
      return "on Time";
    } else {
      return "early";
    }
  }

  bool loaderEnable = false;
  enablingLoader() {
    loaderEnable = true;
    notifyListeners();
  }

  disablingLoader() {
    loaderEnable = false;
    notifyListeners();
  }

  List<AttendanceChartData1> graphData = [];
  List<Timings> attendanceDataPdf = [];

  Map<String, dynamic> sorting(Map<String, dynamic> uidData) {
    // Parse and sort the keys as DateTime objects
    List<String> sortedKeys = uidData.keys.toList()
      ..sort((a, b) {
        var aParts = a.split('-').map(int.parse).toList();
        var bParts = b.split('-').map(int.parse).toList();
        var aDate = DateTime(aParts[2], aParts[1], aParts[0]);
        var bDate = DateTime(bParts[2], bParts[1], bParts[0]);
        return aDate.compareTo(bDate);
      });

    // Create a new map with sorted keys
    Map<String, dynamic> sortedUidData = {};
    for (var key in sortedKeys) {
      sortedUidData[key] = uidData[key];
    }

    // Print the sorted map
    return sortedUidData;
  }

// fetch all months:

  var data2 = {};
  var attendanceMonths = [];

  Future fetchAttendanceMonths() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('attendence').get();
    if (snapshot.exists) {
      data2 = snapshot.value as Map<String, dynamic>;
      attendanceMonths = data2.keys.toList();
    } else {
      print('No data available.');
    }
    return attendanceMonths;
  }

// database variable names:

// for call break list:
  String callBreakListDBName = 'callBreak';

// for casual break list:
  String casualBreakListDBName = 'casualBreak';

// for lunch break list:
  String lunchBreakListDBName = 'lunchBreak';

// for namaz break
  String namazBreakListDBName = 'namazBreak';

// for summit break
  String summitBreakListDBName = 'summitBreak';

  Future<String> downloadURLExample(String filePath) async {
    String downloadURL = await FirebaseStorage.instance
        .ref("$filePath")
        .child("logo.png")
        .getDownloadURL();
    print(downloadURL);
    return downloadURL;
  }

  String differenceShiftTime(String? time1, String? time2) {
    if ((time1 == null) || (time2 == null)) {
      print("${time2} here is time 2");
      return "null";
    } else {
      // Parse the string times into DateTime objects
      DateFormat format = DateFormat("HH:mm:ss");
      DateTime dateTime1 = format.parse(time1);
      DateTime dateTime2 = format.parse(time2);

      // Calculate the time difference
      Duration difference = dateTime2.difference(dateTime1);

      // Convert the time difference to hours
      String hoursDifference =
          (difference.inMinutes / 60.0).toString().substring(0, 3);
      // Extract hours, minutes, and seconds from the time difference
      int hours = difference.inHours;
      int minutes = (difference.inMinutes % 60);
      int seconds = (difference.inSeconds % 60);

      // Format the time difference as "HH:mm:ss"
      String formattedDifference =
          '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

      return formattedDifference;
    }
  }

  List<String> timee = [];

  String? statusCategorization(String dailyArrival) {
    String actualArrivalTime = in_.toString();

    String arrivalCategory = categorizeArrival(actualArrivalTime, dailyArrival);
    timee.add(arrivalCategory);
    return arrivalCategory;
  }

  String categorizeArrival(String actualArrivalTime, String dailyArrival) {
    // Parse the actual and daily arrival times
    DateFormat format = DateFormat("hh:mm:ss a");
    DateTime actualTime = format.parse(actualArrivalTime);

    // Extract hours, minutes, and seconds from the daily arrival
    List<String> dailyArrivalParts = dailyArrival.split(":");
    int dailyHours = int.parse(dailyArrivalParts[0]);
    int dailyMinutes = int.parse(dailyArrivalParts[1]);
    int dailySeconds = int.parse(dailyArrivalParts[2]);

    // Create a DateTime object for the daily arrival time
    DateTime dailyTime = DateTime(
      actualTime.year,
      actualTime.month,
      actualTime.day,
      dailyHours,
      dailyMinutes,
      dailySeconds,
    );

    // Define a threshold of 15 minutes
    Duration lateThreshold = Duration(minutes: 15);

    // Calculate the time difference
    Duration timeDifference = dailyTime.difference(actualTime);

    if (timeDifference > lateThreshold) {
      print(timeDifference.inMinutes);
      return "late";
    } else if (timeDifference < Duration(minutes: 0, hours: 0, seconds: 0)) {
      return "early";
    } else {
      print(timeDifference);
      return "onTime";
    }
  }
// cases for enabling already enabled breaks:

  checkEnabilityBreakBtn(String active, String activeTime) {
    switch (active) {
      case 'Break':
        call_break = true;
        call_break_dict['startTime'] = activeTime;
        break;

      case 'namazBreak':
        namaz_break = true;
        namaz_break_dict['startTime'] = activeTime;
        break;

      case 'lunchBreak':
        lunch_break = true;
        lunch_break_dict['startTime'] = activeTime;
        break;

      case 'casualBreak':
        casual_break = true;
        casual_break_dict['startTime'] = activeTime;
        break;

      case 'summitBreak':
        summit_break = true;
        summit_break_dict['startTime'] = activeTime;
        break;

      default:
    }

    notifyListeners();
  }

// last checkin, checkout, shiftStart ,shiftEnd

  String? lastCheckin;
  String? lastCheckout;
  String? lastShiftStart;
  String? lastShiftEnd;

  lastStats(String month,String date,) async {
    await  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(month)
                        .collection(shift_!)
                        .doc("${date}")
                        .collection(uid!)
                        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        lastShiftStart = data['startShift'] != ''
            ? data['startShift'].toString().substring(11, 19)
            : "not mentioned";
        lastShiftEnd = data['endShift'] != ''
            ? data['endShift'].toString().substring(11, 19)
            : "not mentioned";
      } else {
        print("not ,emtionnned");
      }
    });
    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('attendence/$month/$shift_/$date/$uid').get();
    Map<String, dynamic> data = snapshot.value as Map<String, dynamic>;
    print(snapshot.value);
    lastCheckin = data['checkin'];
    lastCheckout = data['checkout'];
    notifyListeners();
  }

//

// already active break data

  String? alreadyActive;
  String? alreadyActiveTime;

  Duration namazBreakSum = Duration();
  Duration lunchBreakSum = Duration();
  Duration callBreakSum = Duration();
  Duration summitBreakSum = Duration();
  Duration casualBreakSum = Duration();

  bool arrivalButtonsEnability = true;
  bool arrivalButtonsEnabilityLoader = false;

  changeArrivalButtonAvai() {
    arrivalButtonsEnability = false;
    notifyListeners();
  }

  changeArrivalButtonAvaiLoader(bool what) {
    arrivalButtonsEnabilityLoader = what;
    notifyListeners();
  }

// check either collection exist or not?

  Future<bool> doesCollectionExist(
     ) async {
    try {
      final DocumentSnapshot document = await  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc(currentDate)
                        .collection(uid!)
                        .doc(uid!)
                        .get();
      if (document.exists) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        if ((data['startShift'] != "") && (data['endShift'] != "")) {
          submittedShiftStart = data['startShift'];
          submittedShiftEnd = data['endShift'];
          print("your todays shift is complete");
          await changeArrivalButtonAvai();
        } else if ((data['startShift'] != "") && (data['endShift'] == "")) {
          submittedShiftStart = data['startShift'];
          await enableShiftStartButton();
          if ((data['active'] != "") && (data['activeStartTime'] != "")) {
            await checkEnabilityBreakBtn(
                data['active'].toString(), data['activeStartTime'].toString());
          } else {}
          print("your todays shift is  at ${data['startShift']}");
        } else {}

       
        // await lastStats(yesterDay_month!, yesterDay_date!,
        //     );

        await (data["$callBreakListDBName"] != null)
            ? data["$callBreakListDBName"].forEach((item) {
                final List<dynamic> durationParts =
                    item["duration"].split(':').map(int.parse).toList();
                final Duration duration = Duration(
                  hours: durationParts[0],
                  minutes: durationParts[1],
                  seconds: durationParts[2],
                );
                callBreakSum += duration;
              })
            : [];

        // Iterate through namazBreak and calculate the sum of durations
        await (data["$namazBreakListDBName"] != null)
            ? data["$namazBreakListDBName"].forEach((item) {
                final List<dynamic> durationParts =
                    item["duration"].split(':').map(int.parse).toList();
                final Duration duration = Duration(
                  hours: durationParts[0],
                  minutes: durationParts[1],
                  seconds: durationParts[2],
                );
                namazBreakSum += duration;
              })
            : [];

        // Iterate through lunchBreak and calculate the sum of durations
        await (data["$lunchBreakListDBName"] != null)
            ? data["$lunchBreakListDBName"].forEach((item) {
                final List<dynamic> durationParts =
                    item["duration"].split(':').map(int.parse).toList();
                final Duration duration = Duration(
                  hours: durationParts[0],
                  minutes: durationParts[1],
                  seconds: durationParts[2],
                );
                lunchBreakSum += duration;
              })
            : [];

        // Iterate through casualBreak and calculate the sum of durations
        await (data["$casualBreakListDBName"] != null)
            ? data["$casualBreakListDBName"].forEach((item) {
                final List<dynamic> durationParts =
                    item["duration"].split(':').map(int.parse).toList();
                final Duration duration = Duration(
                  hours: durationParts[0],
                  minutes: durationParts[1],
                  seconds: durationParts[2],
                );
                casualBreakSum += duration;
              })
            : [];

        // Iterate through summitBreak and calculate the sum of durations
        await (data["$summitBreakListDBName"] != null)
            ? data["$summitBreakListDBName"].forEach((item) {
                final List<dynamic> durationParts =
                    item["duration"].split(':').map(int.parse).toList();
                final Duration duration = Duration(
                  hours: durationParts[0],
                  minutes: durationParts[1],
                  seconds: durationParts[2],
                );
                summitBreakSum += duration;
              })
            : [];

        print("Total Namaz Break Duration: $callBreakSum");
        print("Total Lunch Break Duration: $namazBreakSum");
        print("Total Namaz Break Duration: $lunchBreakSum");
        print("Total Lunch Break Duration: $casualBreakSum");
        print("Total Lunch Break Duration: $summitBreakSum");

        // coditions for checking either he started shift or end or not

        //--
      } else {
        // Document doesn't exist.
        return false;
      }

      return document.exists;
    } catch (e) {
      // If an error occurs, the collection doesn't exist.
      print(" not exists $e");
      return false;
    }
  }

  Future<void> updateActiveData(var breakOf) {
    return  FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
                        
        .update({
      "active": breakOf.toString(),
      "activeStartTime": DateTime.now().toString().substring(11, 19)
    });
  }

  Future<void> updateActiveDataLocally(var breakOf) {
    FirebaseFirestore.instance.enablePersistence();
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      "active": breakOf.toString(),
      "activeStartTime": DateTime.now().toString().substring(11, 19)
    });
  }

  Future<void> updateActivetoNull() {
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({"active": "", "activeStartTime": ""});
  }

  Future<void> updateActivetoNullLocally() {
    FirebaseFirestore.instance.enablePersistence();
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({"active": "", "activeStartTime": ""});
  }

  String? yesterDay_date;
  String? yesterDay_month;
  String? yesterDay_date2;

  yesterdayDateData() {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate yesterday's date
    DateTime yesterdayDate = currentDate.subtract(Duration(days: 1));

    // Adjust if yesterday was Saturday
    if ((yesterdayDate.weekday == DateTime.saturday) && (shift_ == 'Night')) {
      yesterdayDate = currentDate.subtract(Duration(days: 2));
    } else if ((yesterdayDate.weekday == DateTime.sunday) &&
        (shift_ == 'Day')) {
      yesterdayDate = currentDate.subtract(Duration(days: 2));
    } else {
      yesterdayDate = currentDate.subtract(Duration(days: 1));
    }

    // Format for realtimeDb
    String formattedDate = DateFormat('dd-MM-yyyy').format(yesterdayDate);

    // Format for realtimeDb
    String formattedMonth = DateFormat('MMMM yyyy').format(yesterdayDate);

    // Format for firestore
    String formattedDate2 = DateFormat('yyyy-MM-dd').format(yesterdayDate);

    yesterDay_date = formattedDate;
    yesterDay_date2 = formattedDate2;
    yesterDay_month = formattedMonth;

    notifyListeners();
  }

// find time difference

  String timeDifferenceString(String time1, String time2) {
    // Parse the time strings into DateTime objects
    DateTime dateTime1 = DateTime.parse("2023-01-01 $time1");
    DateTime dateTime2 = DateTime.parse("2023-01-01 $time2");

    // Check if time2 is earlier than time1
    if (dateTime2.isBefore(dateTime1)) {
      // Add one day to dateTime2 if it is earlier
      dateTime2 = dateTime2.add(Duration(days: 1));
    }

    // Calculate the time difference
    Duration difference = dateTime2.difference(dateTime1);

    // Convert the duration to hours, minutes, and seconds
    int hours = difference.inHours;
    int minutes = (difference.inMinutes % 60);
    int seconds = (difference.inSeconds % 60);

    return "${difference.inHours}:${(difference.inMinutes % 60)}:${(difference.inSeconds % 60)}";
  }

  Duration timeDifference(String time1, String time2) {
    // Parse the time strings into DateTime objects
    DateTime dateTime1 = DateTime.parse("2023-01-01 $time1");
    DateTime dateTime2 = DateTime.parse("2023-01-01 $time2");

    // Check if time2 is earlier than time1
    if (dateTime2.isBefore(dateTime1)) {
      // Add one day to dateTime2 if it is earlier
      dateTime2 = dateTime2.add(Duration(days: 1));
    }

    // Calculate the time difference
    Duration difference = dateTime2.difference(dateTime1);

    return difference;
  }

  String getTimeDifference(String startTimeStr, String endTimeStr) {
    List<int> startTimeParts = startTimeStr.split(':').map(int.parse).toList();
    List<int> endTimeParts = endTimeStr.split(':').map(int.parse).toList();

    DateTime startTime = DateTime(
        0, 1, 1, startTimeParts[0], startTimeParts[1], startTimeParts[2]);
    DateTime endTime =
        DateTime(0, 1, 1, endTimeParts[0], endTimeParts[1], endTimeParts[2]);

    if (endTime.isBefore(startTime)) {
      // If end time is before start time, add a day to the end time
      endTime = endTime.add(Duration(days: 1));
    }

    Duration difference = endTime.difference(startTime);

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

// shift timings starting and ending;

  String? startTime;
  String? endTime;

  String? submittedShiftStart;
  String? submittedShiftEnd;

  bool shiftStarted = false;
  bool breakActive = false;

  bool call_break = false;
  bool namaz_break = false;
  bool lunch_break = false;
  bool casual_break = false;
  bool summit_break = false;

  var call_break_controller = ValueNotifier<bool>(false);
  var namaz_break_controller = ValueNotifier<bool>(false);
  var lunch_break_controller = ValueNotifier<bool>(false);
  var casual_break_controller = ValueNotifier<bool>(false);
  var summit_break_controller = ValueNotifier<bool>(false);

  String? activeBreakIndex;

  enableShiftStartButton() {
    shiftStarted = true;
    notifyListeners();
  }

  startShiftTime() async {
    submittedShiftStart = DateTime.now().toString();
    startTime = DateTime.now().toString();
    setStartShiftDb();
    shiftStarted = true;
    print(startTime);
    notifyListeners();
  }

  endShiftTime() async {
    await changeArrivalButtonAvaiLoader(true);
    await checkInternetConnectivity();
    if (internetAvailabilty == "yes") {
      await endShiftDataBase();
      submittedShiftEnd = DateTime.now().toString();

      arrivalButtonsEnability = false;
      endTime = DateTime.now().toString();
      shiftStarted = false;
      await changeArrivalButtonAvaiLoader(false);
      print(endTime);
    } else {
      print("nottt");
      await changeArrivalButtonAvaiLoader(false);
    }

    notifyListeners();
  }

  endShiftTimeEarly(String reason) async {
    await changeArrivalButtonAvaiLoader(true);
    await checkInternetConnectivity();
    if (internetAvailabilty == "yes") {
      await endShiftDataBaseEarly(reason);
      submittedShiftEnd = DateTime.now().toString();
      arrivalButtonsEnability = false;
      endTime = DateTime.now().toString();
      shiftStarted = false;
      await changeArrivalButtonAvaiLoader(false);
      print(endTime);
    } else {
      print("nottt");
      await changeArrivalButtonAvaiLoader(false);
    }

    notifyListeners();
  }

  String? internetAvailabilty;
  checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      internetAvailabilty = "none";
      print("No Internet connection");
    } else if (connectivityResult == ConnectivityResult.mobile) {
      internetAvailabilty = "yes";
      print("Mobile data connection");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      internetAvailabilty = "yes";
      print("Wi-Fi connection");
    }
  }

  Future<void> updateBreaksData2(var data) {
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      "namazBreak": FieldValue.arrayUnion(data),
    });
  }

  Future<void> updateBreaksData(var data, var dataFor) {
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      "$dataFor": FieldValue.arrayUnion([data]),
    });
  }

  Future<void> updateBreaksDataLocally(var data, var dataFor) async {
    FirebaseFirestore.instance.enablePersistence();
    return FirebaseFirestore.instance
                        .collection('timeTracking')
                        .doc(currentMonth)
                        .collection(shift_!)
                        .doc("${currentDate}")
                        .collection(uid!)
                        .doc(uid!)
        .update({
      "$dataFor": FieldValue.arrayUnion([data]),
    });
  }

  changeActiveBreakIndex(String indexOfBreak) async {
    if (shiftStarted == true) {
      activeBreakIndex = indexOfBreak;

      switch (indexOfBreak) {
        case "0":
          if (call_break == true) {
            call_break = false;
            call_break_dict['endTime'] =
                DateTime.now().toString().substring(11, 19);
            call_break_dict['duration'] = timeDifferenceString(
                call_break_dict['startTime'], call_break_dict['endTime']);
            callBreakSum += timeDifference(
                call_break_dict['startTime'], call_break_dict['endTime']);
            await checkInternetConnectivity();
            if (internetAvailabilty == "yes") {
              updateBreaksData(call_break_dict, "callBreak");
              await updateActivetoNull();
            } else {
              updateBreaksDataLocally(call_break_dict, "callBreak");
              updateActivetoNull();
            }
            call_break_dict = {};
          } else if (call_break == false) {
            call_break = true;
            if (internetAvailabilty == "yes") {
              await updateActiveData('Break');
            } else {
              await updateActiveDataLocally('Break');
            }

            call_break_dict['startTime'] =
                DateTime.now().toString().substring(11, 19);
          }

          namaz_break = false;
          lunch_break = false;
          casual_break = false;
          summit_break = false;
          print("call break");
          break;

        case "1":
          if (namaz_break == true) {
            namaz_break = false;
            namaz_break_dict['endTime'] =
                DateTime.now().toString().substring(11, 19);
            namaz_break_dict['duration'] = timeDifferenceString(
                namaz_break_dict['startTime'], namaz_break_dict['endTime']);
            namazBreakSum += timeDifference(
                namaz_break_dict['startTime'], namaz_break_dict['endTime']);
            await checkInternetConnectivity();
            if (internetAvailabilty == "yes") {
              updateBreaksData(namaz_break_dict, "namazBreak");
              updateActivetoNull();
            } else {
              updateBreaksDataLocally(namaz_break_dict, "namazBreak");
              updateActivetoNullLocally();
            }
            namaz_break_dict = {};
          } else if (namaz_break == false) {
            namaz_break = true;
            if (internetAvailabilty == "yes") {
              await updateActiveData('namazBreak');
            } else {
              await updateActiveDataLocally('namazBreak');
            }
            namaz_break_dict['startTime'] =
                DateTime.now().toString().substring(11, 19);
          }
          call_break = false;
          lunch_break = false;
          casual_break = false;
          summit_break = false;
          print("namaz break");
          break;

        case "2":
          if (lunch_break == true) {
            lunch_break = false;
            lunch_break_dict['endTime'] =
                DateTime.now().toString().substring(11, 19);
            lunch_break_dict['duration'] = timeDifferenceString(
                lunch_break_dict['startTime'], lunch_break_dict['endTime']);
            lunchBreakSum += timeDifference(
                lunch_break_dict['startTime'], lunch_break_dict['endTime']);
            await checkInternetConnectivity();
            if (internetAvailabilty == "yes") {
              updateBreaksData(lunch_break_dict, "lunchBreak");
              updateActivetoNull();
            } else {
              updateBreaksDataLocally(lunch_break_dict, "lunchBreak");
              updateActivetoNullLocally();
            }
            lunch_break_dict = {};
          } else if (lunch_break == false) {
            lunch_break = true;
            if (internetAvailabilty == "yes") {
              await updateActiveData('lunchBreak');
            } else {
              await updateActiveDataLocally('lunchBreak');
            }
            lunch_break_dict['startTime'] =
                DateTime.now().toString().substring(11, 19);
          }
          call_break = false;
          namaz_break = false;
          casual_break = false;
          summit_break = false;
          print("lunch break");
          break;

        case "3":
          if (casual_break == true) {
            casual_break = false;
            casual_break_dict['endTime'] =
                DateTime.now().toString().substring(11, 19);
            casual_break_dict['duration'] = timeDifferenceString(
                casual_break_dict['startTime'], casual_break_dict['endTime']);
            casualBreakSum += timeDifference(
                casual_break_dict['startTime'], casual_break_dict['endTime']);
            await checkInternetConnectivity();
            if (internetAvailabilty == "yes") {
              updateBreaksData(casual_break_dict, "casualBreak");
              updateActivetoNull();
            } else {
              updateBreaksDataLocally(casual_break_dict, "casualBreak");
              updateActivetoNullLocally();
            }
            casual_break_dict = {};
          } else if (casual_break == false) {
            casual_break = true;
            if (internetAvailabilty == "yes") {
              await updateActiveData('casualBreak');
            } else {
              await updateActiveDataLocally('casualBreak');
            }
            casual_break_dict['startTime'] =
                DateTime.now().toString().substring(11, 19);
          }

          call_break = false;
          namaz_break = false;
          lunch_break = false;
          summit_break = false;
          print("casual break");
          break;

        case "4":
          if (summit_break == true) {
            summit_break = false;
            summit_break_dict['endTime'] =
                DateTime.now().toString().substring(11, 19);
            summit_break_dict['duration'] = timeDifferenceString(
                summit_break_dict['startTime'], summit_break_dict['endTime']);
            summitBreakSum += timeDifference(
                summit_break_dict['startTime'], summit_break_dict['endTime']);
            await checkInternetConnectivity();
            if (internetAvailabilty == "yes") {
              updateBreaksData(summit_break_dict, "summitBreak");
              updateActivetoNull();
            } else {
              updateBreaksDataLocally(summit_break_dict, "summitBreak");
              updateActivetoNullLocally();
            }
            summit_break_dict = {};
          } else if (summit_break == false) {
            summit_break = true;
            if (internetAvailabilty == "yes") {
              await updateActiveData('summitBreak');
            } else {
              await updateActiveDataLocally('summitBreak');
            }
            summit_break_dict['startTime'] =
                DateTime.now().toString().substring(11, 19);
          }

          call_break = false;
          namaz_break = false;
          lunch_break = false;
          casual_break = false;

          print("summit break");
          break;
        default:
          call_break = false;
          namaz_break = false;
          lunch_break = false;
          casual_break = false;
          summit_break = false;
          print('Invalid day of week.');
      }
    } else {
      null;
      print("Your Shift isn't started");
    }

    notifyListeners();
  }

// 0

  var call_break_dict = {};
  var call_break_list = [];

  var namaz_break_dict = {};
  var namaz_break_list = [];

  var lunch_break_dict = {};
  var lunch_break_list = [];

  var casual_break_dict = {};
  var casual_break_list = [];

  var summit_break_dict = {};
  var summit_break_list = [];

  int activeTab = 4;

  changeSideTab(int tabIndex) {
    activeTab = tabIndex;
    notifyListeners();
  }

  int activeTabTimeTracked = 0;

  changeTimeTrackTab(int tabIndex) {
    activeTabTimeTracked = tabIndex;
    notifyListeners();
  }

  clearProvider() {
    uid = null;
    shift_ = null;
    empId_ = null;
    hours_ = null;
    in_ = null;
    out_ = null;
    profile_ = null;
    profileA_ = null;
    emailA_ = null;
    userEmail = null;
    histShiftStart = null;
    db_name = null;
    lastList = [];
    graphData = [];
    attendanceDataPdf = [];
    data2 = {};
    attendanceMonths = [];

    timee = [];
    lastCheckin = null;
    lastCheckout = null;
    lastShiftStart = null;
    lastShiftEnd = null;
    alreadyActiveTime = null;
    alreadyActive = null;

    namazBreakSum = Duration();
    lunchBreakSum = Duration();
    callBreakSum = Duration();
    summitBreakSum = Duration();
    casualBreakSum = Duration();
    arrivalButtonsEnability = true;

    yesterDay_date = null;
    yesterDay_month = null;

    endTime = null;
    startTime = null;

    submittedShiftStart = null;
    submittedShiftEnd = null;

    shiftStarted = false;
    breakActive = false;

    call_break = false;
    namaz_break = false;
    lunch_break = false;
    casual_break = false;
    summit_break = false;

    activeBreakIndex = null;

    call_break_dict = {};
    call_break_list = [];

    namaz_break_dict = {};
    namaz_break_list = [];

    lunch_break_dict = {};
    lunch_break_list = [];

    casual_break_dict = {};
    casual_break_list = [];

    summit_break_dict = {};
    summit_break_list = [];

    activeTab = 0;

    activeTabTimeTracked = 0;

    notifyListeners();
  }
}

class TimeTrackingData {
  factory TimeTrackingData.fromJson(Map<String, dynamic> json) {
    return TimeTrackingData(
      callBreak: json['address']['street'],
      casualBreak: json['address']['suite'],
      date: json['address']['street'],
      endShift: json['address']['street'],
      lunchBreak: json['username'],
      namazBreak: json['name'],
      serialNo: json['id'],
      startShift: json['address']['street'],
      summitBreak: json['address']['city'],
    );
  }
  int? serialNo;
  String? date;
  String? startShift;
  String? endShift;
  String? callBreak;
  String? namazBreak;
  String? lunchBreak;
  String? casualBreak;
  String? summitBreak;
  TimeTrackingData(
      {required this.callBreak,
      required this.casualBreak,
      required this.date,
      required this.endShift,
      required this.lunchBreak,
      required this.namazBreak,
      required this.serialNo,
      required this.startShift,
      required this.summitBreak});
}

class AttendanceChartData1 {
  var x;
  String? y;
  double? early;
  double? late;
  double? late15;
  AttendanceChartData1(
      {required this.x,
      required this.y,
      required this.early,
      required this.late,
      required this.late15});
}

class ChartData {
  ChartData(this.x, this.x2, this.x3, this.y);
  final int x;
  final int x2;
  final int x3;
  final double? y;
}

class Timings {
  String? date;
  String? checkin;
  String? checkout;
  String? workingHours;
  String? status;

  Timings(
      {required this.date,
      required this.checkin,
      required this.checkout,
      required this.workingHours,
      required this.status});
}
