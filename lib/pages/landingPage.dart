import 'package:emp_sys/pages/attendanceData.dart';
import 'package:emp_sys/pages/profile.dart';
import 'package:emp_sys/pages/reports.dart';
import 'package:emp_sys/pages/timeTrackingData.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/attendanceChart.dart';
import 'package:emp_sys/widgets/break_buttons.dart';
import 'package:emp_sys/widgets/cappbar.dart';
import 'package:emp_sys/widgets/clock.dart';
import 'package:emp_sys/widgets/digitalText.dart';
import 'package:emp_sys/widgets/lastStats.dart';
import 'package:emp_sys/widgets/left_panel.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:emp_sys/widgets/pieChart.dart';
import 'package:emp_sys/widgets/reportCards.dart';
import 'package:emp_sys/widgets/shift_buttons.dart';
import 'package:emp_sys/widgets/sideBarLeft.dart';
import 'package:emp_sys/widgets/startShiftButton.dart';
import 'package:emp_sys/widgets/tabs.dart';
import 'package:emp_sys/widgets/topPanel.dart';
import 'package:emp_sys/widgets/upperTabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    final size = MediaQuery.of(context).size;
    bool state2 = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
             
              Row(
                children: [
                   Expanded(
                    flex: 2,
                    child: Container(
                      child:SideBarLeft()),
                  ),
                  Expanded(
                    flex: 40,
                    child: Column(
                      children: [
                        Container(
                          height: size.height,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: cappbar()),
                                Expanded(
                                  flex: 30,
                                  child:Provider11.activeTab==0?
                                  
                                  
                                   SingleChildScrollView(
                                    child: Column(children: [
                                    
                                                           
                                                             
                                                             Padding(
                                                               padding: const EdgeInsets.symmetric(horizontal: 25),
                                                               child: Stack(
                                     children: [
                                       Align(
                                        alignment: Alignment.topLeft,
                                         child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Multi(color: Colors.white, subtitle: "Dashboard", weight: FontWeight.bold, size: 6)
                                          ],
                                         ),
                                       ),
                                     ],
                                                               ),
                                                             ),
                                                          SizedBox(height: 20,),
                                                              // Container(height: 350.h, child: const clock()),
                                                              Container(height: 160, child: TopPanel()),
                                                              SizedBox(height: 15,),
                                                              Container(height: 400, child:  Padding(
                                    
                                    padding:  EdgeInsets.symmetric(horizontal: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: size.width/2.85,
                                              height: 210,
                                               decoration: BoxDecoration(
                                    color: Color(0xff1F2123),
                                    borderRadius: BorderRadius.circular(10)
                                                              ),
                                              child: Stack(
                                                children: [
                                                  Provider11.arrivalButtonsEnability==true?HomeScreen():
                                           ResponseSubmitted(),
                                          Provider11.arrivalButtonsEnabilityLoader==true?Container(decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.9),

                                           ),
                                           child: Center(child: spinkit),):Container()
                                                ],
                                              )
                                              ),
                                               Container(
                                              width: size.width/2.85,
                                              height: 170,
                                               decoration: BoxDecoration(
                                    color: Color(0xff1F2123),
                                    borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child:LastStatis()
                                             ),
                                  
                                  
                                          ],
                                        ),
                                        
                                          Container(
                                          width: size.width/2.85,
                                           decoration: BoxDecoration(
                                    color: Color(0xff1F2123),
                                    borderRadius: BorderRadius.circular(10)
                                                              ),
                                          child: AttendanceChart()),
                                           pieChartData(),
                                            // TimeTrakingReports()
                                       
                                      ],
                                    ),
                                                              ),),
                                                              ],),
                                  ):Provider11.activeTab==1?TimeTrakingReports():Provider11.activeTab==2?AttendanceData():Provider11.activeTab==3?Reports():EmployeeProfile()),
                              
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Provider11.loaderEnable==true? Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),

            ),
            child:spinkit ,
          ):Container(),

       
        ],
      ),
    );
  }
}



final spinkit = SpinKitSpinningLines(
  color: Color.fromARGB(255, 182, 42, 190),
size: 50,
 
);





