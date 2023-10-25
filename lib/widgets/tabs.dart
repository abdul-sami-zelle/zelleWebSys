import 'dart:async';
import 'package:emp_sys/widgets/multi.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


class Tab1 extends StatelessWidget {
  String? heading;
  String? img;
  String? count;
    List<Color> color;
      List<Color> color1;

  Tab1({super.key,required this.count,required this.heading,required this.img,required this.color,required this.color1});

  @override
  Widget build(BuildContext context) {
    return  
    
     Container(
      width: 40.w,
      height: 80.h,
      decoration: BoxDecoration(
        
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: Color(0xff009ae2),
            blurRadius: 3,
            spreadRadius: 3
          ),
          BoxShadow(
            offset: Offset(0, 0),
            color: Color(0xffb929be),
            blurRadius: 3,
            spreadRadius: 3
          )
        ],  
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 15, 20, 23),
Color.fromARGB(255, 16, 18, 20)
        ]),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,

            ),
            child: Padding(
              padding:EdgeInsets.all(8.r),
              child: Image.network("$img"),
            ),
          ),
            )),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Multi(color: Colors.white, subtitle: "$heading", weight: FontWeight.bold, size: 5),
                SizedBox(height: 10.h,),
                Multi(color: Colors.white, subtitle: "$count", weight: FontWeight.bold, size: 7),
               
              ],
            )),
        
        ],
      ),
    );
  }
}


