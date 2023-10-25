import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/utils/sizedBoxHeadingtoContent.dart';
import 'package:emp_sys/widgets/digitalText.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastStatis extends StatelessWidget {
  const LastStatis({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return  Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child:Row(
                                children: [
                                   Expanded(
                              flex: 2,
                              child: Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Last Check in",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/in.png",height: 35,width: 35,),
                                        ],
                                      ),
                                  SizedBoxHeadtoCont(),
                                     Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: "${Provider11.lastCheckin}",
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              ) 
                            ),
                             Expanded(
                              flex: 2,
                              child:Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Last Check Out",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/out1.png",height: 35,width: 35,),
                                        ],
                                      ),
                                      SizedBoxHeadtoCont(),
                                      Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: "${Provider11.lastCheckout}",
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              )  
                            )
                                ],
                              ) 
                            ),
                             Expanded(
                              flex: 2,
                              child:Row(
                                children: [
                                   Expanded(
                              flex: 2,
                              child:Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Last Shift Start",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/shiftStart.png",height: 30,width: 30,),
                                        ],
                                      ),
                                      SizedBoxHeadtoCont(),
                                      Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: "${Provider11.lastShiftStart}",
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              )  
                            ),
                             Expanded(
                              flex: 2,
                              child:Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Last Shift End",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/shiftend.png",height: 30,width: 30,),
                                        ],
                                      ),
                                      SizedBoxHeadtoCont(),
                                      Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: "${Provider11.lastShiftEnd}",
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              )  
                            )
                                ],
                              ) 
                            ),
                          ],
                        );
  }
}





class ResponseSubmitted extends StatelessWidget {
  const ResponseSubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.network("https://cdn-icons-png.flaticon.com/128/5610/5610944.png", height: 50,width: 50,),
                                                  Multi(color: Colors.white, subtitle: "Your Today's Response  has been Subitted", weight: FontWeight.normal, size: 4),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                              flex: 2,
                              child:Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Today's Shift Start",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/shiftstart.png",height: 30,width: 30,),
                                        ],
                                      ),
                                      SizedBoxHeadtoCont(),
                                      Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: Provider11.submittedShiftStart.toString().substring(11,19),
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              )  
                            ),
                            Expanded(
                              flex: 2,
                              child:Padding(
                                padding:EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Multi(
                                  color: Color(0xff8F95A2),
                                  subtitle: "Today's Shift End",
                                  weight: FontWeight.bold,
                                  size: 3.5),
                                          Image.asset("assets/images/shiftend.png",height: 30,width: 30,),
                                        ],
                                      ),
                                      SizedBoxHeadtoCont(),
                                      Column(
                                        children: [
                                          Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Digital(
                                      color: Colors.white,
                                      subtitle: Provider11.submittedShiftEnd.toString().substring(11,19),
                                      weight: FontWeight.w600,
                                      size: 5),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.w300,
                                      size: 3),
                                ],
                                                          ),
                                                          SizedBox(
                                width: 1,
                                                          ),
                                                         
                                        ],
                                      )
                                    ],
                                  ) ,
                                ),
                              )  
                            )
                                                    ],
                                                  )
                                                ],
                                              );
  }
}