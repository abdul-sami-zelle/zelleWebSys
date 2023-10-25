import 'package:emp_sys/pages/testing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class table extends StatelessWidget {
  String name;
  String tName;
  table({super.key, required this.name,required this.tName});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text(name),
        Container(
          
            height: 180.h,
            width: 90.w,
            color: Colors.amberAccent,
            child: UserInformation()),
      ],
    );
  }
}
