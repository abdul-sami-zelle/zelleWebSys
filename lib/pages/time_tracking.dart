import 'package:emp_sys/widgets/cappbar.dart';
import 'package:emp_sys/widgets/left_panel.dart';
import 'package:emp_sys/widgets/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class time_tracking extends StatelessWidget {
  const time_tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 800.h,
        width: 800.w,
        color: const Color.fromARGB(255, 32, 35, 50),
        child: Column(
          children: [
            cappbar(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height:500.h ,
                    width: 400.w,
                    child:leftpanel()),
                ),
              ),
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 550.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                    
                          // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                          ToggleSwitch(
                            minWidth: 55.w,
                            initialLabelIndex: 0,
                            totalSwitches: 5,
                            inactiveFgColor:const Color.fromARGB(255, 32, 35, 50) ,
                            inactiveBgColor: Colors.white,
                            labels: ['Yesterday', 'Today', 'Last 7 days','Last month','Filter'],
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(height: 200.h,width: 90.w,color: Colors.amberAccent,
                              child: Column(
                                children: [
                                  table(name: 'Call Break', tName: 'Break',),
                    
                                ],
                              ),),
                            ),
                           Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(height: 200.h,width: 90.w,color: Colors.amberAccent,
                              child: Column(
                                children: [
                                  table(name: 'Lunch Break', tName: 'lunchBreak',),
                    
                                ],
                              ),),
                            ),
                           Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(height: 200.h,width: 90.w,color: Colors.amberAccent,
                              child: Column(
                                children: [
                                  table(name: 'Namaz Break', tName: 'namazBreak',),
                    
                                ],
                              ),),
                            ),
                          ],),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 55,
                                      
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.white),
                                    ),
                                    Text('number of call breaks')
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.white),
                                  ),
                                  Text('number of namaz breaks')
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 55,
                                      
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.white),
                                    ),
                                    Text('number of lunch breaks')
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 10, 20, 10),
                                      child: Container(
                      height: 240.h,
                      width: 170.w,
                      color: Colors.blueAccent,
                                      ),
                                    ),
                                    Container(
                                      height: 240.h,
                                      width: 100.w,
                                      color: Colors.transparent,
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Start time',style:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
                        
                        Text('End time',style:TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
                      ],
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
