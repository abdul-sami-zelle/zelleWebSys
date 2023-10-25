
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';

class ReportCards extends StatelessWidget {
  String? imgAddress;
  String? value;
  String? heading;
  String? subHeading;
  ReportCards({super.key,required this.imgAddress,required this.value,required this.heading,required this.subHeading});

  @override



  
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
        height: 100,
      width: (size.width < 1320 && size.width > 1161)
          ? 140
          : (size.width < 1161)
              ? 110
              : (size.width > 1600)
                  ? 200
                  : 180,
      decoration: BoxDecoration(
          color: Color(0xff1F2123), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Multi(color: Colors.white, subtitle: "${value.toString()=="null"?"00":value}", weight: FontWeight.bold, size: 6),
                    Multi(color: Colors.green, subtitle: "$subHeading", weight: FontWeight.normal, size: 2.5),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black
                  ),
                  child: Padding(
                    padding:EdgeInsets.all(5),
                    child: Image.asset("$imgAddress",height: 25,width: 25,color: Color(0xff424344),),
                  ),
                ),
      
              ],
            ),
            SizedBox(height: 20,),
            Multi(color: Colors.white, subtitle: "$heading", weight: FontWeight.bold, size: 3)
          ],
        ),
      ),
    );
  }
}