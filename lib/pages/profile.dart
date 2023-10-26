import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/eventsUI.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class EmployeeProfile extends StatelessWidget {
  const EmployeeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        primary: true,
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height / 1.2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailedInfo(),
                      SizedBox(
                        height: 20,
                      ),
                      TaskStats()
                    ],
                  ),
                ),
              ),
              ProgressDetails()
            ],
          )
        ],
      ),
    );
  }
}

class DetailedInfo extends StatelessWidget {
  const DetailedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    final size = MediaQuery.of(context).size;
      List<String> dateList = [];
  getDates() {
  DateTime startDate = DateTime(DateTime.now().year, 10, 1); // Start date: October 1st of the current year
  DateTime endDate = DateTime.now(); // Today's date



  for (var date = startDate; date.isBefore(endDate) || date.isAtSameMomentAs(endDate); date = date.add(Duration(days: 1))) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    dateList.add(formattedDate);
  }

  for (var date in dateList) {
    print(date);
  }
}

 getFireBaseSubCollection(List<String> dates, String mainCollection ,String uid) async{

    for (var i = 0; i < dates.length; i++) {
        final DocumentSnapshot document = await FirebaseFirestore.instance.collection("$mainCollection").doc("$uid").collection(dates[i]).doc("$uid").get();
        if (document.exists) {
          print("data exists");

        } else {
          print("data not exists");
        }
    }
    

}


    return Container(
      width: size.width / 1.6,
      height: size.height / 2.85,
      decoration: BoxDecoration(
          color: Color(0xff1F2123), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: size.height / 3.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 15),
                            Multi(
                                color: Colors.white,
                                subtitle: "${Provider11.name_}",
                                weight: FontWeight.bold,
                                size: 6),
                            SizedBox(height: 15),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Position",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle:
                                              "     ${Provider11.designation_}",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Role",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "            User",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Email",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle:
                                              "          ${Provider11.emailA_}",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Phone",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "        770000000000",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Company",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "   Zelle Solutions",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "DOB",
                                          weight: FontWeight.w500,
                                          size: 3),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "            17-10-2000",
                                          weight: FontWeight.w500,
                                          size: 3),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   flex: 2,
                //   child: Padding(
                //     padding:  EdgeInsets.symmetric(vertical: 5),
                //     child: Container(
                //       height: double.infinity,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Padding(
                //         padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                //         child: Column(
                //           children: [
                //                             Row(
                //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 Multi(
                //                                     color: Colors.white,
                //                                     subtitle: "Yearly Ranking",
                //                                     weight: FontWeight.bold,
                //                                     size: 3.5),
                //                                 Container(
                //                                   height: 30,
                //                                   width: 60,
                //                                   child: ElevatedButton(
                //                                     style: ElevatedButton.styleFrom(
                //                                       backgroundColor: Color(0xff414243),
                //                                       padding: EdgeInsets.symmetric(horizontal: 1)
                //                                     ),
                                                    
                //                                     onPressed: (){
                      
                //                                     }, 
                //                                     child:Multi(color: Colors.white, subtitle: "Claim", weight: FontWeight.bold, size: 2.5)
                //                                     ),
                //                                 )
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               height: 20,
                //                             ),
                //                             Image.asset("assets/images/rank.png",height: 120,width: 120,),
                //                             SizedBox(
                //                               height: 20,
                //                             ),
                //                             Column(
                //                               children: [
                //                                 Multi(
                //                                     color: Colors.white,
                //                                     subtitle: "Total Points",
                //                                     weight: FontWeight.w500,
                //                                     size: 3),
                //                                 SizedBox(height: 5,),
                //                                 Multi(
                //                                     color: Colors.white,
                //                                     subtitle: "Total Points",
                //                                     weight: FontWeight.w500,
                //                                     size: 4),
                //                               ],
                //                             ),
                                            
                      
                //           ],
                //         ),
                //       ),
                //     ),
                //   )
                //   )




    
               Expanded(
                  flex: 2,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Stack(
                        children: [
                          Positioned(
                            top:10,
                            left: 10,
                            child:  Multi(
                                                    color: Colors.white,
                                                    subtitle: "Yearly Ranking",
                                                    weight: FontWeight.bold,
                                                    size: 3.5),),
                          Positioned(
                            top:0,
                            right: 0,
                            child: Image.network("https://cdn-icons-png.flaticon.com/128/179/179249.png",height: 100,width: 100,)),
                          Align(
                            alignment: Alignment.bottomRight,
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                                    height: 30,
                                                    width: 60,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Color(0xff414243),
                                                        padding: EdgeInsets.symmetric(horizontal: 1)
                                                      ),
                                                      
                                                      onPressed: ()async{

     

        // final DocumentSnapshot document = await FirebaseFirestore.instance.collection("morning_Shift").doc("2dCXtkkraFST33jeRvgG4WWkT9i2").get();
                                                            // print(document.data());
                                                            // .doc('2dCXtkkraFST33jeRvgG4WWkT9i2').collection('comments')
                                                    //  await  getDates();
                                                    //  await  getFireBaseSubCollection(dateList,"morning_Shift","2dCXtkkraFST33jeRvgG4WWkT9i2");

                //                                    await  FirebaseFirestore.instance
                // .collection('timeTracking')
                // .doc(Provider11.currentMonth)
                // .collection(Provider11.shift_!)
                // .doc("${Provider11.currentDate}")
                // // .collection("${Provider11.uid}")
                // // .doc("${Provider11.uid}")
                // .get().then((DocumentSnapshot documentSnapshot) {
                //   if (documentSnapshot.exists) {
                //       Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                //       print(documentSnapshot.id);
                //   } else {
                    
                //   }
                // });


    //              await  FirebaseFirestore.instance
    //             .collection('timeTracking')
    //             .doc(Provider11.currentMonth)
    //             .collection(Provider11.shift_!)
    //             // .doc("${Provider11.currentDate}")
    //             // .collection("${Provider11.uid}")
    //             // .doc("${Provider11.uid}")
    //             .get().then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //         // print(doc.data()['']);
    //     });
    // });


    Provider11.addDates();






                                                      }, 
                                                      child:Multi(color: Colors.white, subtitle: "Claim", weight: FontWeight.bold, size: 2.5)
                                                      ),
                                                      ),
                            )),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child:  Column(
                                              children: [
                                                Multi(
                                                    color: Colors.white,
                                                    subtitle: "Total Points",
                                                    weight: FontWeight.w500,
                                                    size: 3),
                                                SizedBox(height: 5,),
                                                Multi(
                                                    color: Colors.white,
                                                    subtitle: "Total Points",
                                                    weight: FontWeight.w500,
                                                    size: 4),
                                              ],
                                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 20,
                            child: Multi(color: Colors.white, subtitle: "2", weight: FontWeight.bold, size: 30)),
                          Positioned(
                            top: 65,
                            left: 90,
                            child: Multi(color: Colors.white, subtitle: "nd", weight: FontWeight.bold, size: 4)),
                          Positioned(
                            bottom: 65,
                            right: 50,
                            child: Image.asset("assets/images/increase.png",height: 50,width: 50,))
                        ],
                      )                   
                      ),
                  )
                  )
















              
              ],
            ),
            // Positioned(
            //     top: 20,
            //     right: 220,
            //     child: Row(
            //       children: [
            //         Image.network(
            //           "https://cdn-icons-png.flaticon.com/128/3536/3536505.png",
            //           width: 20,
            //           height: 20,
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Image.network(
            //           "https://cdn-icons-png.flaticon.com/128/1409/1409946.png",
            //           width: 20,
            //           height: 20,
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Image.network(
            //           "https://cdn-icons-png.flaticon.com/128/733/733547.png",
            //           width: 20,
            //           height: 20,
            //         ),
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }
}

class ProgressDetails extends StatefulWidget {
  const ProgressDetails({super.key});

  @override
  State<ProgressDetails> createState() => _ProgressDetailsState();
}

class _ProgressDetailsState extends State<ProgressDetails> {
  @override
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
//  selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<Meeting> list = [
    Meeting(
        eventName: "Sunday",
        from: DateTime(2023, 11, 5),
        to: DateTime(2023, 11, 5),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 11, 12),
        to: DateTime(2023, 11, 12),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 11, 19),
        to: DateTime(2023, 11, 19),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 11, 26),
        to: DateTime(2023, 11, 26),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 10, 7),
        to: DateTime(2023, 10, 7),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 10, 21),
        to: DateTime(2023, 10, 21),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 11, 4),
        to: DateTime(2023, 11, 4),),
    Meeting(
        eventName: "OFF",
        from: DateTime(2023, 11, 18),
        to: DateTime(2023, 11, 18),),
  ];

  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    final size = MediaQuery.of(context).size;
    bool isDateInDataSource(DateTime date) {
      for (Meeting meeting in Provider11.list) {
        if (meeting.from.year == date.year &&
            meeting.from.month == date.month &&
            meeting.from.day == date.day) {
          return true;
        }
      }
      return false;
    }

    return Container(
      width: (size.width < 1201 && size.width > 1000)
          ? size.width / 3.55
          : (size.width < 1001 && size.width > 899)
              ? size.width / 3.7
              : (size.width < 900 && size.width > 700)
                  ? size.width / 3.9
                  : size.width / 3.45,
      height: size.height / 1.2,
      decoration: BoxDecoration(
          color: Color(0xff1F2123), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: SfCalendar(
                viewHeaderStyle: ViewHeaderStyle(
                    dayTextStyle: TextStyle(color: Colors.white)),
                minDate: DateTime(2023, 10, 01),
                maxDate: DateTime(2023, 11, 30),
                view: CalendarView.month,
                monthCellBuilder:
                    (BuildContext context, MonthCellDetails details) {
                  // Check if the date is in the data source
                  if (isDateInDataSource(details.date)) {
                    return Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Provider11.list
                                        .where((meeting) =>
                                            meeting.from.year ==
                                                details.date.year &&
                                            meeting.from.month ==
                                                details.date.month &&
                                            meeting.from.day ==
                                                details.date.day)
                                        .map((meeting) => meeting.eventName)
                                        .join('\n')
                                        .toString() ==
                                    'OFF'
                                ? Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                details.date.day.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                Provider11.list
                                    .where((meeting) =>
                                        meeting.from.year ==
                                            details.date.year &&
                                        meeting.from.month ==
                                            details.date.month &&
                                        meeting.from.day == details.date.day)
                                    .map((meeting) => meeting.eventName)
                                    .join('\n'),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    color: Colors.transparent, // Default cell background color
                    child: Center(
                      child: Text(
                        details.date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },

                headerStyle: CalendarHeaderStyle(
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                // dataSource: MeetingDataSource(list),
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayCount: 1,
                    numberOfWeeksInView: 6,
                    showTrailingAndLeadingDates: false,
                    dayFormat: 'E',
                    monthCellStyle: MonthCellStyle(
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 10))),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Multi(
                          color: Colors.white,
                          subtitle: "Up Coming Events",
                          weight: FontWeight.bold,
                          size: 4),
                      SizedBox(
                        height: 15,
                      ),
                      Slider2(),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class TaskStats extends StatelessWidget {
  const TaskStats({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width / 3.1,
            height: size.height / 2.2,
            decoration: BoxDecoration(
                color: Color(0xff1F2123),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
                    height: double.infinity,
                    width: 300,
                    child: Padding(
                      padding:EdgeInsets.only(top: 10,bottom: 0,right: 10,left: 10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Multi(
                          color: Colors.white,
                          subtitle: "Personal Information",
                          weight: FontWeight.bold,
                          size: 4),
                              ],
                            )),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                     
                                        child: Padding(
                                          padding:EdgeInsets.all(10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                                SizedBox(height: 2,),
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                           decoration: BoxDecoration(
                                          border: Border(
                                            right:BorderSide(
                                              width: 2,
                                              color: Color(0xff1F2123)
                                            ),
                                            left:BorderSide(
                                              width: 2,
                                              color: Color(0xff1F2123)
                                            )
                                          )
                                        ),
                                        child: Padding(
                                                                           padding:EdgeInsets.all(10),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                                SizedBox(height: 2,),
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                              ],
                                            ),
                                        ),
                                      ),),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:EdgeInsets.all(10),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                              SizedBox(height: 2,),
                                              Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                            ],
                                          ),
                                      ),)
                                  ],
                                ),
                              ),
                            )),
                           Expanded(
                            flex: 3,
                            child: Padding(
                              padding:EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                     
                                        child: Padding(
                                          padding:EdgeInsets.all(10),
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                                SizedBox(height: 2,),
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                           decoration: BoxDecoration(
                                          border: Border(
                                            right:BorderSide(
                                              width: 2,
                                              color: Color(0xff1F2123)
                                            ),
                                            left:BorderSide(
                                              width: 2,
                                              color: Color(0xff1F2123)
                                            )
                                          )
                                        ),
                                        child: Padding(
                                                                           padding:EdgeInsets.all(10),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                                SizedBox(height: 2,),
                                                Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                              ],
                                            ),
                                        ),
                                      ),),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:EdgeInsets.all(10),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                              SizedBox(height: 2,),
                                              Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 3),
                                            ],
                                          ),
                                      ),)
                                  ],
                                ),
                              ),
                            )),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding:EdgeInsets.only(left:10),
                                  child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Multi(color: Colors.white, subtitle: "Joining Date", weight: FontWeight.bold, size: 2.5),
                                                  SizedBox(height: 2,),
                                                  Multi(color: Colors.white, subtitle: "abdulsami.zellesolutions@gmail.com", weight: FontWeight.bold, size: 3),
                                                ],
                                              ),
                                ),
                              ),
                            )),
                        ],
                      ),
                    ),
                  ),
          ),
          //  SizedBox(width: 20,),
          Container(
            width: size.width / 3.5,
            height: size.height / 2.2,
            decoration: BoxDecoration(
                color: Color(0xff1F2123),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               
                              
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding:EdgeInsets.only(bottom: 5,top: 5),
                                  child: Container(
                                    height: size.height / 2.3,
                                    width: size.width / 7,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Multi(
                                              color: Colors.white,
                                              subtitle: "My Incentive Level",
                                              weight: FontWeight.bold,
                                              size: 3.5),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 105,
                                            width: 100,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                    top: 5,
                                                    child: Image.asset(
                                                      "assets/images/hexagon.png",
                                                      height: 100,
                                                      width: 100,
                                                      color: Color(0xff64FDC2),
                                                    )),
                                                Image.asset(
                                                  "assets/images/hexagon.png",
                                                  height: 100,
                                                  width: 100,
                                                  color: Color(0xff414243),
                                                ),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Multi(
                                                        color: Colors.white,
                                                        subtitle: "70",
                                                        weight: FontWeight.w500,
                                                        size: 8.5)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Column(
                                            children: [
                                              LinearPercentIndicator(
                                                barRadius: Radius.circular(10),
                                                width: 160,
                                                lineHeight: 5,
                                                percent: 0.8,
                                                progressColor: Color(0xff64FDC2),
                                                backgroundColor: Color(0xff414243),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 135,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Multi(
                                                        color: Colors.white,
                                                        subtitle:
                                                            "2023 to next Level",
                                                        weight: FontWeight.w500,
                                                        size: 2),
                                                    Multi(
                                                        color: Colors.white,
                                                        subtitle: "80%",
                                                        weight: FontWeight.w500,
                                                        size: 2),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          // Image.network("https://cdn-icons-png.flaticon.com/128/11881/11881947.png",height: 40,width: 40,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      //  Expanded(
                      //   flex: 4,
                      //   child: Padding(
                      //     padding:EdgeInsets.only(bottom: 4,right: 20,left: 20),
                      //     child: Container(color: Colors.purple,),
                      //   )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5,top: 5),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child: BarChart1(chartData: [
                                    ChartData2(2019, 3.43),
                                    ChartData2(2020, 3.6),
                                    ChartData2(2021, 5.8),
                                    ChartData2(2022, 5.8),
                                    ChartData2(2023, 8),
                                    ChartData2(2024, 8.2),


                                  ], color: [
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.6),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1)
                                  ], color1: [
                                    Color.fromARGB(255, 11, 226, 4),
                                    Color.fromARGB(255, 11, 226, 4)
                                  ], barName: 'Attendence', img: 'assets/images/increase.png',),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child:  BarChart1(chartData: [
                                   ChartData2(2019, 3.43),
ChartData2(2020, 8.2),
ChartData2(2021, 8),
ChartData2(2022, 5.8),
ChartData2(2023, 5.8),
ChartData2(2024, 3.6),
ChartData2(2025, 3.2),
ChartData2(2026, 2.7),


                                  ], color: [
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.1),
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.6),
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.1)
                                  ], color1: [
                                    Color.fromARGB(255, 219, 15, 15),
                                    Color.fromARGB(255, 219, 15, 15)
                                  ], barName: 'Arrival', img: 'assets/images/decrease.png',),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child:  BarChart1(chartData: [
                                   ChartData2(2019, 3.43),
ChartData2(2020, 3.6),
ChartData2(2021, 5.8),
ChartData2(2022, 5.8),
ChartData2(2023, 8),
ChartData2(2024, 8.2),


                                  ], color: [
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.6),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1)
                                  ], color1: [
                                    Color.fromARGB(255, 11, 226, 4),
                                    Color.fromARGB(255, 11, 226, 4)
                                  ],barName:  'Completing Hours', img: 'assets/images/increase.png',),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child:  BarChart1(chartData: [
                                   ChartData2(2019, 3.43),
ChartData2(2020, 3.6),
ChartData2(2021, 5.8),
ChartData2(2022, 5.8),
ChartData2(2023, 8),
ChartData2(2024, 8.2),


                                  ], color: [
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.6),
                                    Color.fromARGB(255, 11, 226, 4).withOpacity(0.1)
                                  ], color1: [
                                    Color.fromARGB(255, 11, 226, 4),
                                    Color.fromARGB(255, 11, 226, 4)
                                  ], barName: 'Performance', img: 'assets/images/increase.png',),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                    child: BarChart1(chartData: [
                                   ChartData2(2019, 3.43),
ChartData2(2020, 8.2),
ChartData2(2021, 8),
ChartData2(2022, 5.8),
ChartData2(2023, 5.8),
ChartData2(2024, 3.6),
ChartData2(2025, 3.2),
ChartData2(2026, 2.7),


                                  ], color: [
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.1),
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.6),
                                    Color.fromARGB(255, 219, 15, 15).withOpacity(0.1)
                                  ], color1: [
                                    Color.fromARGB(255, 219, 15, 15),
                                    Color.fromARGB(255, 219, 15, 15)
                                  ], barName: 'Extra Performance', img: 'assets/images/decrease.png',),
                                ),
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleAvatar extends StatelessWidget {
  const CircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -5,
          bottom: -5,
          child: Container(
            height: size.height / 3.7,
            width: size.height / 3.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              border: Border.all(width: 1, color: Colors.white),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        Positioned(
          right: -4,
          bottom: -4,
          child: Container(
            height: size.height / 3.7,
            width: size.height / 3.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              color: Color(0xff1F2123),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        Container(
          height: size.height / 3.5,
          width: size.height / 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: NetworkImage("${Provider11.profileA_}"),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class MyEvents {
  final DateTime date;
  final String eventTitle;
  final String eventDescp;

  MyEvents(
      {required this.date, required this.eventTitle, required this.eventDescp});

  @override
  String toString() => eventTitle;
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[
    Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(minutes: 10)),
      subject: 'Sunday Off',
      color: Colors.amber,
      notes: "Offf",
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 10, 1),
      endTime: DateTime(2023, 10, 1),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 10, 8),
      endTime: DateTime(2023, 10, 8),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 10, 15),
      endTime: DateTime(2023, 10, 15),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 10, 22),
      endTime: DateTime(2023, 10, 22),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    //  Appointment(
    //   startTime: DateTime(2023, 10, 29),
    //   endTime: DateTime(2023, 10, 29),
    //   subject: 'Sunday Off',
    //   color: Colors.amber,
    //   startTimeZone: '',
    //   endTimeZone: '',

    // ),
    Appointment(
      startTime: DateTime(2023, 11, 5),
      endTime: DateTime(2023, 11, 5),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),

    Appointment(
      startTime: DateTime(2023, 11, 6),
      endTime: DateTime(2023, 11, 6),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 11, 7),
      endTime: DateTime(2023, 11, 7),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 11, 8),
      endTime: DateTime(2023, 11, 8),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 11, 9),
      endTime: DateTime(2023, 11, 9),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2023, 11, 19),
      endTime: DateTime(2023, 11, 19),
      subject: 'Sunday Off',
      color: Colors.amber,
      startTimeZone: '',
      endTimeZone: '',
    ),
  ];
  final now = DateTime.now();
  final nextMonth = now.add(const Duration(days: 30));

  final filteredAppointments = appointments.where((appointment) {
    return appointment.startTime.isAfter(now) &&
        appointment.startTime.isBefore(nextMonth);
  }).toList();

  return _AppointmentDataSource(filteredAppointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class Slider2 extends StatefulWidget {
  const Slider2({super.key});

  @override
  State<Slider2> createState() => _Slider2State();
}

class _Slider2State extends State<Slider2> {
  @override
  late PageController _pageController;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.3);
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    List<EventsUiData> sliderImgs = [
      EventsUiData(
          day: "12",
          date: "Sat",
          month: "September",
          time: "10AM - 12PM",
          location: "Dinein Restraunt",
          imgAddress:
              "https://res.cloudinary.com/diecwxxmm/image/upload/v1698059891/zellesolutions%20portal/zffnsl3lwlwkzmowkbix.jpg"),
      EventsUiData(
          day: "12",
          date: "Sat",
          month: "September",
          time: "10AM - 12PM",
          location: "Dinein Restraunt",
          imgAddress:
              "https://res.cloudinary.com/diecwxxmm/image/upload/v1698059891/zellesolutions%20portal/zffnsl3lwlwkzmowkbix.jpg"),
      EventsUiData(
          day: "12",
          date: "Sat",
          month: "September",
          time: "10AM - 12PM",
          location: "Dinein Restraunt",
          imgAddress:
              "https://res.cloudinary.com/diecwxxmm/image/upload/v1698059891/zellesolutions%20portal/zffnsl3lwlwkzmowkbix.jpg"),
    ];
    return CarouselSlider.builder(
        itemCount: sliderImgs.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: EventsUi(
                  day: sliderImgs[index].day,
                  date: sliderImgs[index].date,
                  month: sliderImgs[index].month,
                  time: sliderImgs[index].time,
                  location: sliderImgs[index].location,
                  imgAddress: sliderImgs[index].imgAddress));
        },
        options: CarouselOptions(
          height: 160,
          autoPlay: true,
          reverse: true,
          autoPlayInterval: Duration(seconds: 5),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
          },
        ));
  }
}

class EventsUiData {
  String? day;
  String? date;
  String? month;
  String? time;
  String? location;
  String? imgAddress;
  EventsUiData(
      {required this.day,
      required this.date,
      required this.month,
      required this.time,
      required this.location,
      required this.imgAddress});
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }


  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }


}

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;


  Meeting(
      {required this.eventName,
      required this.from,
      required this.to,
});
}

class ChartData2 {
  ChartData2(this.x, this.y);
  final int x;
  final double y;
}

class BarChart1 extends StatefulWidget {
  List<Color> color;
  List<Color> color1;
  List<ChartData2> chartData;
  String? barName;
  String? img;
  BarChart1(
      {super.key,
      required this.chartData,
      required this.color,
      required this.color1,
      required this.barName,
      required this.img
      });

  @override
  State<BarChart1> createState() => _BarChart1State();
}

class _BarChart1State extends State<BarChart1> {
  @override
  @override
  @override
  Widget build(BuildContext context) {
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(0.9);

    final LinearGradient gradientColors =
        LinearGradient(colors: widget.color, stops: stops);
    return  Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:EdgeInsets.all(8.0),
            child: Multi(color: Colors.white, subtitle: "${widget.barName}", weight: FontWeight.w500, size: 3.2),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
        ),
         Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding:EdgeInsets.all(8.0),
            child: Row(
              children: [
                Multi(color: Colors.white, subtitle: "+1", weight: FontWeight.w500, size:4),
                SizedBox(width: 10,),
                Image.asset("${widget.img}",height: 20,width: 20,)
              ],
            ),
          ),
        ),
          Positioned(
            right: 5,
            bottom: 2,
            child: Container(
              width: 50,
              height: 80,
                    child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: NumericAxis(
                          majorGridLines: MajorGridLines(width: 0),
                          axisLine: AxisLine(width: 0),
                          isVisible: false,
                          borderWidth: 0,
                        ),
                        primaryYAxis: NumericAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            axisLine: AxisLine(width: 0),
                            isVisible: false,
                            borderWidth: 0),
                        series: <ChartSeries>[
                      SplineAreaSeries<ChartData2, int>(
                        dataSource: widget.chartData,
                        xValueMapper: (ChartData2 data, _) => data.x,
                        yValueMapper: (ChartData2 data, _) => data.y,
                        animationDuration: 4000,
                        gradient: gradientColors,
                        borderWidth: 2,
                        borderGradient: LinearGradient(
                            colors: widget.color1, stops: <double>[0.2, 0.9]),
                      ),
                    ])),
          ),
        ],
      ),
    );
  }
}

class ChartData1 {
  ChartData1({required this.x, required this.y});
  int? x;
  final double y;
}
