import 'package:emp_sys/utils/sizedBoxHeadingtoContent.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class pieChartData extends StatelessWidget {
  const pieChartData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
    width: size.width/5,
    
  decoration: BoxDecoration(
  color: Color(0xff1F2123),
  borderRadius: BorderRadius.circular(10)
),
child: Padding(
  padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  child:   Column(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: [
  
  
  
      Row(
  
        mainAxisAlignment: MainAxisAlignment.start,
  
        children: [
  
          Multi(color: Colors.white, subtitle: "Statistics", weight: FontWeight.w400, size: 4),
  
        ],
  
      ),
  
      SizedBoxHeadtoCont(),
  
      Dougnut(),
  
      SizedBoxHeadtoCont(),
  
      Container(
  
        width: size.width/5.5,
  
     
  
         decoration: BoxDecoration(
  
    color: Color(0xff424344),
  
    borderRadius: BorderRadius.circular(10)
  
  ),
  
  child: Column(
  
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  
    crossAxisAlignment: CrossAxisAlignment.center,
  
    children: [
      SizedBox(height: 5,),
      pieChartLegends(legendColor: Colors.amber, legendName: 'Productive Hours', legendPercent: '5',),
  
      pieChartLegends(legendColor: Color(0xff64FDC2), legendName: 'Call Break Hours', legendPercent: '5',),
  
      pieChartLegends(legendColor: Color(0xffFFB976), legendName: 'Namaz Break Hours', legendPercent: '5',),
  
      pieChartLegends(legendColor: Color(0xffAE8BFF), legendName: 'Linch Break Hours', legendPercent: '5',),
  
      pieChartLegends(legendColor: Color(0xff48A7FF), legendName: 'Casual Break Hours', legendPercent: '5',),
  
      pieChartLegends(legendColor: Color(0xff4832A2), legendName: 'Summit Break Hours', legendPercent: '5',)
  
    ],
  
  ),
  
      )
  
    ],
  
  ),
),
);

  }
}





class Dougnut extends StatelessWidget {
  const Dougnut({super.key});

@override
Widget build(BuildContext context) {
  
  return  
   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    
                    startDegreeOffset: 200,
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: [
                      PieChartSectionData(
                        value: 35,
                        color: Colors.amber,
                        radius: 35,
                        showTitle: false,
                      ),
                       PieChartSectionData(
                        value: 27,
                        color: Color(0xff64FDC2),
                        radius: 25,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 30,
                        color: Color(0xffFFB976),
                        radius: 25,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Color(0xffAE8BFF),
                        radius: 20,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 35,
                        color: Color(0xff48A7FF),
                        radius: 25,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Color(0xff4832A2),
                        radius: 20,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff424344),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff1F2123),
                              blurRadius: 10.0,
                              spreadRadius: 10.0,
                              offset: const Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                        child:  Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Multi(color: Colors.white, subtitle: "100", weight: FontWeight.bold, size: 5),
                              SizedBox(width: 4,),
                              Multi(color: const Color.fromARGB(255, 80, 229, 85), subtitle: "hr", weight: FontWeight.normal, size: 3),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
   
    
  );
}
}



class pieChartLegends extends StatelessWidget {
  String? legendName;
   Color? legendColor;
    String? legendPercent;
  pieChartLegends({super.key,required this.legendColor,required this.legendName,required this.legendPercent});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  EdgeInsets.only(left: 10,right: 10,bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 10,
             decoration: BoxDecoration(
      color: legendColor,
      borderRadius: BorderRadius.circular(10)
    ),
          ),
          SizedBox(width: 6,),
          Multi(color: Colors.white, subtitle: "$legendName", weight: FontWeight.w300, size: 2),
        ],
      ),
       Multi(color: Colors.white, subtitle: "${legendPercent}%", weight: FontWeight.w300, size: 2),
        ],
      ),
    );
  }
}