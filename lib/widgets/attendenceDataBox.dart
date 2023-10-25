import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';

class AttendenceBox extends StatelessWidget {
  String? checkin;
  String? checkout;
  String? hours;
  String? dates;
  String? status;
  AttendenceBox({super.key,required this.checkin,required this.checkout,required this.hours,required this.dates,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          left: BorderSide(color:status=="early"?Colors.green:status=="late"?Colors.red:Colors.blue,width: 2)
        )
      ),
      child: Padding(
        padding:EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Multi(color: Colors.white, subtitle: "$dates", weight: FontWeight.w500, size: 3),
                Container(
                  
                  width: 60,
                  decoration: BoxDecoration(
                    color: status=="early"?Colors.green.withOpacity(0.3):status=="late"?Colors.red.withOpacity(0.3):Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:Center(
                    child: Multi(color: Colors.white, subtitle: "$status", weight: FontWeight.normal, size: 3),
                  ) ,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Multi(color: Colors.grey, subtitle: "Check In", weight: FontWeight.normal, size: 3),
                    SizedBox(height: 5,),
                    Multi(color: Colors.grey, subtitle: "$checkin", weight: FontWeight.normal, size: 4),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Multi(color: Colors.grey, subtitle: "Check Out", weight: FontWeight.normal, size: 3),
                    SizedBox(height: 5,),
                    Multi(color: Colors.grey, subtitle: "$checkout", weight: FontWeight.normal, size: 4),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Multi(color: Colors.grey, subtitle: "Total Time", weight: FontWeight.normal, size: 3),
                    SizedBox(height: 5,),
                    Multi(color: Colors.grey, subtitle: "${hours}", weight: FontWeight.normal, size: 4),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}