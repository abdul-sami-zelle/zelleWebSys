import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:html' as html;

class StackLineChart extends StatefulWidget {
  const StackLineChart({super.key});

  @override
  State<StackLineChart> createState() => _StackLineChartState();
}
  int? selectedOption;
class _StackLineChartState extends State<StackLineChart> {
@override
late GlobalKey<SfCartesianChartState> _cartesianChartKey;
late List<ChartData> _chartData;
void initState() {
 

  super.initState();
}

    Widget build(BuildContext context) {
      _cartesianChartKey = GlobalKey();
      final Provider11 = Provider.of<Provider1>(context, listen: true);
      
  _chartData = [
        ChartData("this", 2, 4, 6),
        ChartData("that", 7, 3, 2),
        ChartData("thos", 2, 4, 5),
        ChartData("ws", 3, 6, 7),
        ChartData("wer", 6, 4, 7),
        ChartData("ref", 2, 6, 0),
        ChartData("wfc", 4, 5, 6),


      ];
        Future<List?> _renderChartAsImage() async {
  final double pixelRatio = 2.0; // Try using a lower pixel ratio (e.g., 2.0)
  final ui.Image data = await _cartesianChartKey.currentState!.toImage(pixelRatio: pixelRatio);
  final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageBytes = bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  return imageBytes;
}

    
         return  Container(
            decoration: BoxDecoration(
          color: Color(0xff1F2123), borderRadius: BorderRadius.circular(10)),
             child: Column(
               children: [
      SizedBox(height: 20,),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
      
            Multi(color: Colors.white, subtitle: "Arrival Graph", weight: FontWeight.bold, size: 3.5),
      
      
      
      
            Row(
              children: [
                        Row(
                          children: [
                            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
              activeColor: Colors.amber,
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            
          ),
          Multi(color: Colors.white, subtitle: "last 7 days", weight: FontWeight.w500, size: 2.5),
                          ],
                        ),
            SizedBox(width: 5,),
        Row(
          children: [
            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  activeColor: Colors.amber,
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                
              ),
            Multi(color: Colors.white, subtitle: "last 15 days", weight: FontWeight.w500, size: 2.5),
          ],
        ),
        SizedBox(width: 5,),
          Row(
            children: [
              Radio(
                  fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  activeColor: Colors.amber,
                  value: 3,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              Multi(color: Colors.white, subtitle: "last 30 days", weight: FontWeight.w500, size: 2.5),
            ],
          ),
          
              ],
            ),
          ],
        ),
      ),
  SizedBox(height: 20,),
                 SfCartesianChart(
                   key: _cartesianChartKey,
                     primaryXAxis: CategoryAxis(
                          //Hide the gridlines of x-axis 
         majorGridLines: MajorGridLines(width: 0), 
         //Hide the axis line of x-axis 
         axisLine: AxisLine(width: 0), 
                     ),
                     series: <ChartSeries>[
                       
                         StackedLineSeries<ChartData, String>(
                            markerSettings: MarkerSettings(
                             isVisible: true
                            ),
                             dataSource: _chartData,
                             xValueMapper: (ChartData data, _) => data.x,
                             yValueMapper: (ChartData data, _) => data.y1
                         ),
                         StackedLineSeries<ChartData, String>(
                           markerSettings: MarkerSettings(
                             isVisible: true
                            ),
                             dataSource: _chartData,
                             xValueMapper: (ChartData data, _) => data.x,
                             yValueMapper: (ChartData data, _) => data.y2
                         ),
                          StackedLineSeries<ChartData, String>(
                           markerSettings: MarkerSettings(
                             isVisible: true
                            ),
                             dataSource: _chartData,
                             xValueMapper: (ChartData data, _) => data.x,
                             yValueMapper: (ChartData data, _) => data.y3
                         ),
                       
                     ]
                 ),
                  TextButton(
        child: const Text('Export as image'),
        onPressed: () {
          _renderChartAsImage ();
        },
      )
               ],
             )
         );
    }



}



    class ChartData {
        ChartData(this.x,this.y1,this.y2, this.y3);
        String x;
        final int y1;
        final int y2;
        final int? y3;

    }
