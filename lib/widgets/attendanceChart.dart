import 'package:emp_sys/utils/sizedBoxHeadingtoContent.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceChart extends StatelessWidget {
  const AttendanceChart({super.key});


  @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
        final List<ChartData> chartData = [
            ChartData(2000,1, 10, 13 ),
            ChartData(2001,3, 14, 14 ),
            ChartData(2002,3, 9, 10),
            ChartData(2003,9, 10, 9 ),
            ChartData(2004,12, 7, 8 ),
            ChartData(2005,7, 10, 12 ),
            ChartData(2006,6, 6, 10 ),
        ];
        return Padding(
          padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Multi(color: Colors.white, subtitle: "Arrivals", weight: FontWeight.w400, size: 4),
               ],
             ),
              SizedBoxHeadtoCont(),
              Container(
                  child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  
                       primaryXAxis: NumericAxis( 
                  //Hide the gridlines of x-axis 
                  majorGridLines: MajorGridLines(width: 0), 
                  //Hide the axis line of x-axis 
                  axisLine: AxisLine(width: 0), 
              ), 
         
              primaryYAxis: NumericAxis( 
                  //Hide the gridlines of y-axis 
                  majorGridLines: MajorGridLines(width: 1), 
                  //Hide the axis line of y-axis 
                  axisLine: AxisLine(width: 1) 
                     ), 
                    
                    enableAxisAnimation: true,
        
                    backgroundColor: Color(0xff1F2123),
                      series: <ChartSeries>[
                        
                          SplineSeries<ChartData, int>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              color: Colors.red
                              ),
                          SplineSeries<ChartData, int>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.x2,
                              color: Colors.green
                              ),
                          SplineSeries<ChartData, int>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.x3,
                              color: Colors.amber
                              )
                          ]
                      )
                  ),
                  Container(
                      width: size.width/4,
              height: 30,
               decoration: BoxDecoration(
          color: Color(0xff424344),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AttendanceChartLegends(legendColor: Colors.red, legendName: "Late arrival"),
            AttendanceChartLegends(legendColor: Colors.green, legendName: "On Time"),
            AttendanceChartLegends(legendColor: Colors.amber, legendName: "15 min Late"),
          ],
        ),
                  )
            ],
          ),
        );
        }
    
    }

    class ChartData {
        ChartData(this.x,this.x2,this.x3, this.y);
        final int x;
        final int x2;
        final int x3;
        final double? y;

    }



class AttendanceChartLegends extends StatelessWidget {
  String? legendName;
  Color? legendColor;
  AttendanceChartLegends({super.key,required this.legendColor,required this.legendName});

  @override
  Widget build(BuildContext context) {
    return  Row(
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
          Multi(color: Colors.white, subtitle: "$legendName", weight: FontWeight.w300, size: 3),
        ],
      );
  }
}