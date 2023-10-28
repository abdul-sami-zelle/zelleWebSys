import 'package:emp_sys/pages/attendanceData.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:emp_sys/widgets/multiCentered.dart';
import 'package:emp_sys/widgets/reportCards.dart';
import 'package:emp_sys/widgets/stackLineChartReports.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'dart:html';
import 'dart:ui';
import 'package:http/http.dart' show get;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' show get;




class Reports extends StatefulWidget {
   Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
String _selectedValue =  DateFormat('MMMM yyyy').format(DateTime.now());

String? statusCategorization(String dailyArrival,String? scheduledArrival) {
 

  String arrivalCategory = categorizeArrival(scheduledArrival!, dailyArrival);
  return arrivalCategory;
}

String categorizeArrival(String actualArrivalTime, String dailyArrival) {
  // Parse the actual and daily arrival times
  DateFormat format = DateFormat("hh:mm:ss a");
  DateTime actualTime = format.parse(actualArrivalTime);

  // Extract hours, minutes, and seconds from the daily arrival
  List<String> dailyArrivalParts = dailyArrival.split(":");
  int dailyHours = int.parse(dailyArrivalParts[0]);
  int dailyMinutes = int.parse(dailyArrivalParts[1]);
  int dailySeconds = int.parse(dailyArrivalParts[2]);

  // Create a DateTime object for the daily arrival time
  DateTime dailyTime = DateTime(
    actualTime.year,
    actualTime.month,
    actualTime.day,
    dailyHours,
    dailyMinutes,
    dailySeconds,
  );

  // Define a threshold of 15 minutes
  Duration lateThreshold = Duration(minutes: 15);

  // Calculate the time difference
  Duration timeDifference = dailyTime.difference(actualTime);

  if (timeDifference > lateThreshold) {
    lateArrival.add(double.parse(timeDifference.inMinutes.toString()));
    late15min.add(0);
    onTimemArrival.add(0);
    return timeDifference.inMinutes.toString();
  } 
  else if(timeDifference <= lateThreshold && timeDifference>Duration(minutes: 0,hours: 0,seconds: 0)){
    lateArrival.add(0);
    onTimemArrival.add(0);
    late15min.add(double.parse(timeDifference.inMinutes.toString()));
    return timeDifference.inMinutes.toString();
  }
  else {
    print(timeDifference);
    lateArrival.add(0);
    late15min.add(0);
    onTimemArrival.add(double.parse(timeDifference.inMinutes<0?(timeDifference.inMinutes*-1).toString():timeDifference.inMinutes.toString()));
    return timeDifference.inMinutes.toString();
  }
}

late GlobalKey<SfCircularChartState> _cartesianChartKey;

late GlobalKey<SfCircularChartState> _cartesianChartKeyRadial;

late GlobalKey<SfCartesianChartState> _cartesianChartKeyColumn;

List<int>? imgGraph;
List<int>? imgGraph2;
List<int>? imgGraph3;

   Future<List?> _renderChartAsImage() async {
  final double pixelRatio = 2.0; // Try using a lower pixel ratio (e.g., 2.0)
  final ui.Image data = await _cartesianChartKey.currentState!.toImage(pixelRatio: pixelRatio);
  final ui.Image data2 = await _cartesianChartKeyRadial.currentState!.toImage(pixelRatio: pixelRatio);
  final ui.Image data3 = await _cartesianChartKeyColumn.currentState!.toImage(pixelRatio: pixelRatio);
  final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  final ByteData? bytes2 = await data2.toByteData(format: ui.ImageByteFormat.png);
  final ByteData? bytes3 = await data3.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageBytes = bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  final Uint8List imageBytes2 = bytes2!.buffer.asUint8List(bytes2.offsetInBytes, bytes2.lengthInBytes);
  final Uint8List imageBytes3 = bytes3!.buffer.asUint8List(bytes3.offsetInBytes, bytes3.lengthInBytes);
  imgGraph=imageBytes;
  imgGraph2=imageBytes2;
  imgGraph3=imageBytes3;
  return imageBytes;
}

List<double> lateArrival = [];

List<double> onTimemArrival = [];

List<double> late15min = [];

int index = 0; 

var attenData = [];

var attenDates = [];



String? totalTime;

String? totalLate;

String? totalEarly;

String? onTime;



  List<AttendanceChartData1> graphData = [];

  final List<ChartDataProgress> chartDataProgress = [
            ChartDataProgress('Namaz Break', 25),
            ChartDataProgress('Call Break', 38),
            ChartDataProgress('Lunch Break', 34),
            ChartDataProgress('Casual Break', 52),
            ChartDataProgress('Summit Break', 200)
        ];

List<Timings> attendanceDataPdf = [];

  Widget build(BuildContext context) {
_cartesianChartKey = GlobalKey();
_cartesianChartKeyRadial = GlobalKey();
_cartesianChartKeyColumn = GlobalKey();
    final size = MediaQuery.of(context).size;
     final Provider11 = Provider.of<Provider1>(context, listen: true);




List<DougnutChartData> categoryChart = [

];

 cleanAllData(){
  setState(() {
      index=0;
  attendanceDataPdf = [];
  graphData = [];
  attenData = [];
  lateArrival = [];
  onTimemArrival = [];
  late15min = [];
  attenDates = [];
  });
 }
      Future fetchFireBaseData()async{

 var dataFinal = {};
       index=0;
  attendanceDataPdf = [];
  graphData = [];
  attenData = [];
  lateArrival = [];
  onTimemArrival = [];
  late15min = [];
  attenDates = [];
  // await Future.delayed(Duration(seconds: 3));
  final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('attendence/${_selectedValue}/${Provider11.shift_}').get();
if (snapshot.exists) {
  final Map<String, dynamic> data = snapshot.value as Map<String, dynamic>;

    // Initialize an empty Map to store the data for the specified UID
    final Map<String, dynamic> uidData = {};
    
    // Specify the UID you want to retrieve
    

    // Loop through the data and extract data for the desired UID
    data.forEach((date, dateData) {
      if (dateData.containsKey(Provider11.uid)) {
        index++;
       
        uidData[date] = dateData[Provider11.uid];
       
        // print('${Provider11.octoberDates[date].toString()} here are dates');


        uidData[date]['checkin']==null?index--:graphData.add(AttendanceChartData1(x: date, y:statusCategorization(uidData[date]['checkin'],Provider11.octoberDates[date].toString()), early: onTimemArrival[index-1], late: lateArrival[index-1], late15:late15min[index-1]));
      }
    });
    print("${uidData} data is herere");
    DateTime parseDate(String dateStr) {
    final parts = dateStr.split('-');
    if (parts.length == 3) {
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      return DateTime(year, month, day);
    }
    return DateTime(0); // Return a default value for invalid dates.
  }
   graphData.sort((a, b) {
      final aDate = parseDate(a.x);
      final bDate = parseDate(b.x);
      return aDate.compareTo(bDate);
    });
    final Map<String, dynamic> finalData = Provider11.sorting(uidData);
    for (var i = 0; i < finalData.length; i++) {
      print("${finalData.keys.toList()[i]} ---> ${i}");
        attendanceDataPdf.add(Timings(checkin:finalData.values.toList()[i]['checkin']==null?"null":finalData.values.toList()[i]['checkin'], checkout:finalData.values.toList()[i]['checkout']==null?"null":finalData.values.toList()[i]['checkout'], date:finalData.keys.toList()[i].toString(), workingHours:finalData.values.toList()[i]['checkin']==null||finalData.values.toList()[i]['checkout']==null?"00:00:00": Provider11.getTimeDifference(finalData.values.toList()[i]['checkin'].toString(),finalData.values.toList()[i]['checkout'].toString()), status:finalData.values.toList()[i]['checkin']==null?"00:00:00": Provider11.statusCategorization2(finalData.values.toList()[i]['checkin'].toString(),finalData.keys.toList()[i].toString()), serial: i+1));

    }
    // Print the extracted data for the specified UID
    attenData=finalData.values.toList();
    attenDates = finalData.keys.toList();
    dataFinal =finalData;
    print(lateArrival);
    print(onTimemArrival);
    print(late15min);

    for (var i = 0; i < graphData.length; i++) {
      print("${graphData[i].early}  ${graphData[i].late}  ${graphData[i].late15} ${graphData[i].x}");
    }
   












    int totalHours = 0;
  int totalMinutes = 0;
  int totalSeconds = 0;



  for (int i = 0; i < attendanceDataPdf.length; i++) {
    String timeString = attendanceDataPdf[i].workingHours!;
    List<String> timeParts = timeString.split(':');
    if (timeParts.length == 3) {
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      int seconds = int.parse(timeParts[2]);

      totalHours += hours;
      totalMinutes += minutes;
      totalSeconds += seconds;
    } else {
      print('Invalid time format for element $i: $timeString');
    }
  }

  // Adjust totalMinutes and totalSeconds for overflow
  totalMinutes += totalSeconds ~/ 60;
  totalSeconds %= 60;
  totalHours += totalMinutes ~/ 60;
  totalMinutes %= 60;
   double fractionalHours = totalHours + (totalMinutes / 60.0);

 totalTime ='${fractionalHours.toStringAsFixed(1)}';

  print('Total Time: $totalHours hours, $totalMinutes minutes, $totalSeconds seconds');
    
} else {
    print('No data available.');
}

  // Create a Map to store the counts
  Map<String, int> countMap = {};

  for (int i = 0; i < attendanceDataPdf.length; i++) {
    String? status = attendanceDataPdf[i].status!;
   if (status != null) {
      countMap[status] = (countMap[status] ?? 0) + 1;
    }
  }
  print(countMap);
  // Print the counts
  countMap.forEach((status, count) {
    print('$status: $count');
  });

  onTime = countMap['on Time'].toString();
  totalEarly = countMap['early'].toString();
  totalLate = countMap['late'].toString();
  categoryChart = [
  DougnutChartData("on Time", onTime.toString()=="null"?0:int.parse(onTime.toString()), Color.fromRGBO(13, 81, 139, 1)),
  DougnutChartData("Early", totalEarly.toString()=="null"?0:int.parse(totalEarly.toString()), Color.fromRGBO(9, 55, 95, 1)),
  DougnutChartData("late", totalLate.toString()=="null"?0:int.parse(totalLate.toString()), Color.fromRGBO(69, 160, 237, 1)),
  DougnutChartData("total offs", 0, Color.fromRGBO(230, 121, 47, 1)),
  DougnutChartData("total Leaves", 0, const Color.fromARGB(255, 200, 20, 7)),
  ];
 final list1 = [onTime,totalEarly,totalLate];
 print(list1);
  
return attenData;
}

    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        scrollDirection: Axis.vertical,
        primary: true,
        children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Multi(color: Colors.white, subtitle: "Reports", weight: FontWeight.bold, size: 6),
                                              Container()
                                            ],
                                           ),
          ),
          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Provider11.changeTimeTrackTab(0);
                                      },
                                      child: Row(
                                                       
                                                           ),
                                    ),
                                    SizedBox(width: 15,),
                                    
                                   
                                  ],
                                ),
                                 Row(
                                   children: [
        
        
        
        
                                    FutureBuilder(
                                
                                        future: Provider11.fetchAttendanceMonths(),
                                        initialData: "Code sample",
                                        builder: (BuildContext context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            );
                                          }
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                  'An ${snapshot.error} occurred',
                                                  style: const TextStyle(fontSize: 18, color: Colors.red),
                                                ),
                                              );
                                            } else if (snapshot.hasData) {
                                              final data = snapshot.data;
                                           List<DropdownMenuItem<String>> dropdownItems = data.map<DropdownMenuItem<String>>((month) {
        return DropdownMenuItem<String>(
        value: month,
        child: Text(
        month,
        style: TextStyle(color: Colors.white),
        ),
        );
        }).toList();
                                              print("${data} data is here");
                                              return  
        Container(
                                width: 230,
                                child: DropdownButton(
                                  isExpanded: true,
                                  dropdownColor: Colors.black,
                                  icon: null,
                                  iconEnabledColor: Colors.white,
                                  hint: Multi(
                                      color: Colors.white,
                                      subtitle: "",
                                      weight: FontWeight.normal,
                                      size: 3),
                                  value: _selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      attendanceDataPdf = [];
                                      _selectedValue = value!;      
                                    });
                                    print(_selectedValue);
                                  },
                                  items:dropdownItems,
                                ),
                              );
        
        
                                      
                                            }
                                          }
                              
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                    
                              ),
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                                  
                                     GestureDetector(
                                      onTap: () async{
                                      
                                       try {
                                      await  Provider11.enablingLoader();
                                           await _renderChartAsImage();
                                      //  attendanceDataPdf,imgGraph
                                       await PdfService().printCustomersPdf(
                                        attendanceDataPdf,
                                        imgGraph,
                                        imgGraph2,
                                        imgGraph3,
                                        (attendanceDataPdf.length*9).toString() , 
                                        totalTime, 
                                        "1", 
                                        "2", 
                                        totalEarly,
                                         totalTime, 
                                         totalLate,
                                         Provider11.profileA_,
                                         Provider11.name_,
                                         Provider11.empId_,
                                         Provider11.designation_,
                                         Provider11.emailA_,
                                         Provider11.shift_,
                                         Provider11.in_,
                                         Provider11.out_
                                         );
                                               index=0;
        attendanceDataPdf = [];
graphData = [];
         attenData = [];
 lateArrival = [];
 var dataFinal = {};
 onTimemArrival = [];

 late15min = [];
   attenDates = [];
                                        Provider11.disablingLoader();
                                       } catch (e) {
                                         Provider11.disablingLoader();
                                       }
                                      },
                                      child: Image.network("https://cdn-icons-png.flaticon.com/128/5261/5261933.png",height: 20,width: 20,color:Colors.white,)),
                                   ],
                                 )
                              ],
                            ),
                           
                          SizedBox(height: 10,),
    
          FutureBuilder(
                                
                                        future: fetchFireBaseData(),
                                        initialData: "Code sample",
                                        builder: (BuildContext context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            );
                                          }
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                  'An ${snapshot.error} occurred',
                                                  style: const TextStyle(fontSize: 18, color: Colors.red),
                                                ),
                                              );
                                            } else if (snapshot.hasData) {
                                            
                                              return ListView(
                                                shrinkWrap: true,
                                                primary: true,
                                                scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    
                    height: 300,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Multi(color: Colors.white, subtitle: "Cummulative Stats", weight: FontWeight.bold, size: 3.5),
                          SizedBox(height: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                ReportCards(imgAddress: 'assets/images/totalHours.png', value: '$totalTime', heading: 'Total Working Hours', subHeading: 'hours',),
                                SizedBox(width: 10,),
                                ReportCards(imgAddress: 'assets/images/in.png', value: '$totalLate', heading: 'Total Late Arrivals', subHeading: 'arrivals',),
                                SizedBox(width: 10,),
                                ReportCards(imgAddress: 'assets/images/in.png', value: '$onTime', heading: 'On Times', subHeading: 'arrivals',),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                ReportCards(imgAddress: 'assets/images/in.png', value: '$totalEarly', heading: 'Total Early Arrivals', subHeading: 'arrivals',),
                                SizedBox(width: 10,),
                                ReportCards(imgAddress: 'assets/images/off.png', value: '00', heading: 'Total Offs', subHeading: 'days',),
                                SizedBox(width: 10,),
                                ReportCards(imgAddress: 'assets/images/leave.png', value: '00', heading: 'Total Leaves', subHeading: 'days',),
                                ],
                              )
                               
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
                  // SizedBox(height: 30,),
                  Container(
                    height: 300,
                    width:size.width/4,
                    child:Container(
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
                ],
              ),
            ),
              SizedBox(height: 10,),
              Container(
                height: 250,
                width: size.width/3.6,
                child: SfCircularChart(
                
                  key: _cartesianChartKey,
                  legend: Legend(
                        isVisible: true,
                        textStyle: TextStyle(color: Color(0xff8D939F),fontWeight: FontWeight.bold)
                      ),
                            series: <CircularSeries>[
                               
                                DoughnutSeries<DougnutChartData, String>(
                                    dataSource: categoryChart,
                                    pointColorMapper:(DougnutChartData data,  _) => data.color,
                                    xValueMapper: (DougnutChartData data, _) => data.x,
                                    yValueMapper: (DougnutChartData data, _) => data.y
                                )
                            ]
                        ),
              )
    
             
                      
                     ],
                   )
               )
                    ),
                Container(
      height: 300,
                    width:size.width/4,
      
      child:   Container(
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
                  Multi(color: Colors.white, subtitle: "Time Utilization", weight: FontWeight.bold, size: 3.5),
                ],
              ),
            ),
              SizedBox(height: 10,),
          Container(
            height: 250,
            child: SfCircularChart(
              key: _cartesianChartKeyRadial,
            legend: Legend(
                              isVisible: true,
                               textStyle: TextStyle(color: Color(0xff8D939F),fontWeight: FontWeight.bold)
                              
                            ),
                                    series: <CircularSeries>[
            
                                        // Renders radial bar chart
            
                                        RadialBarSeries<ChartDataProgress, String>(
                                         trackColor: Color(0xff424344),
                                     cornerStyle: CornerStyle.bothCurve,
            
                                            dataSource: chartDataProgress,
            
                                            xValueMapper: (ChartDataProgress data, _) => data.x,
            
                                            yValueMapper: (ChartDataProgress data, _) => data.y
            
                                        )
            
                                    ]
            
                                ),
          ),
        ],
      ),
      ),
    )
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding:EdgeInsets.only(left:20 ),
                child: Multi(color: Colors.white, subtitle: "Attendence Record", weight: FontWeight.bold, size: 3.5),
              ),
              SizedBox(height: 20,),
              Container(
                
                                             decoration: BoxDecoration(
                                      color: Color(0xff1F2123),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                child: DataTable(
                                                  columnSpacing: 17,
                                                  headingRowHeight: 70,
                                                  columns: [
                                                    
                                                    DataColumn(
                                                    
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "S No.", weight: FontWeight.bold, size: 3)
                                                      ),
                                                    DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Date", weight: FontWeight.bold, size: 3)
                                                      ),
                                                    DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Actual Check in", weight: FontWeight.bold, size: 3)
                                                      ),
                                                      DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Actual Check Out", weight: FontWeight.bold, size: 3)
                                                      ),
                                                  
                                                      DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Check in", weight: FontWeight.bold, size: 3)
                                                      ),
                                                      DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Check Out", weight: FontWeight.bold, size: 3)
                                                      ),
                                                      DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Working Hours", weight: FontWeight.bold, size: 3)
                                                      ),
                                                          DataColumn(
                                                      label: Multi(color: Color(0xff8F95A2), subtitle: "Status", weight: FontWeight.bold, size: 3)
                                                      ),
                                                    
                                                  ], 
                                                  rows: attendanceDataPdf.map((e)=>DataRow(
                                                    cells: [
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.serial.toString(), weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.date.toString(), weight: FontWeight.normal, size: 3)),                                               
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle: Provider11.octoberDates[e.date].toString(), weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle:  Provider11.out_.toString(),  weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle:  e.checkin.toString(), weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.checkout.toString(), weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.workingHours.toString(), weight: FontWeight.normal, size: 3)),
                                                    DataCell(Multi(color: Color(0xff8F95A2), subtitle:e.status.toString(), weight: FontWeight.normal, size: 3)),
                                                  ])).toList()
                                                  ),
              ),
      
            Container(
              height: 400,
              child: SfCartesianChart(
                key: _cartesianChartKeyColumn,
               
                primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          
                            ColumnSeries<AttendanceChartData1, int>(
                              
                                name: "Early Arrivals",
                                dataSource: graphData,
                                color: Colors.amber,
                                xValueMapper: (AttendanceChartData1 data, _) => int.parse(data.x.toString()[1]!='-'?data.x.toString().substring(0,2):data.x.toString().substring(0,1)),
                                yValueMapper: (AttendanceChartData1 data, _) => data.early as int
                            ),
                            ColumnSeries<AttendanceChartData1, int>(
                              //  splineType: SplineType.cardinal,
                              //   cardinalSplineTension: 2.3,
                              name: "Late Arrivals",
                              color: Colors.red,
                                dataSource: graphData,
                                xValueMapper: (AttendanceChartData1 data, _) =>  int.parse(data.x.toString()[1]!='-'?data.x.toString().substring(0,2):data.x.toString().substring(0,1)),
                                yValueMapper: (AttendanceChartData1 data, _) => data.late as int
                            ),
                             ColumnSeries<AttendanceChartData1, int>(
                              name: "Ontime Arrivals",
                                dataSource: graphData,
                                color: Colors.green,
                                xValueMapper: (AttendanceChartData1 data, _) =>  int.parse(data.x.toString()[1]!='-'?data.x.toString().substring(0,2):data.x.toString().substring(0,1)),
                                yValueMapper: (AttendanceChartData1 data, _) => data.late15 as int
                            ),
                        ]
                    ),
            )
              
            ],
          );
                                            }
                                          }
                              
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                    
                              ),
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
class Timings{
      int? serial;
      String? date;
      String? checkin;
      String? checkout;
      String? workingHours;
      String? status;
  
  Timings({
    required this.serial,
    required this.date,
    required this.checkin,
    required this.checkout,
    required this.workingHours,
    required this.status
    });
}

class AttendanceChartData1 {
  var x;
  String? y;
  double? early;
  double? late;
  double? late15;
  AttendanceChartData1({required this.x,required this.y,required this.early,required this.late,required this.late15});
}













class PdfService {
  Future<void> printCustomersPdf(List<Timings> data,
  var graphData,
  var graphData2,
  var graphData3,
  String? actualTime,
  String? paidTime,
  String? totalOffs,
  String? totalLeaves,
  String? earlyArrival,
  String? totalOntime,
  String? lateArrival,
  String? imgUrl,
  String? name,
  String? employeId,
  String? designation,
  String? email,
  String? shift,
  String? startTime,
  String? endTime,

  ) async {


//Create a new pdf document
PdfDocument document = PdfDocument();

 document.pageSettings.margins.all = 5;

//Create the header with specific bounds
PdfPageTemplateElement header = PdfPageTemplateElement(
    Rect.fromLTWH(0, 0, document.pageSettings.size.width, 100));

//Create the footer with specific bounds
PdfPageTemplateElement footer = PdfPageTemplateElement(
    Rect.fromLTWH(0, 0, document.pageSettings.size.width, 80));




//Add the header at top of the document
document.template.top = header;


//Add the footer at the bottom of the document
document.template.bottom = footer;
  


  final ByteData assetData1 = await rootBundle.load('assets/images/footer.png');
  final Uint8List imageBytes1 = assetData1.buffer.asUint8List();

  final ByteData assetData2 = await rootBundle.load('assets/images/header.png');
  final Uint8List imageBytes2 = assetData2.buffer.asUint8List();

  // Create PdfBitmap objects from the asset images
  final PdfBitmap image1 = PdfBitmap(imageBytes1);
  final PdfBitmap image2 = PdfBitmap(imageBytes2);




  footer.graphics.drawImage(
      image1,
      Rect.fromLTWH(
          0, 0, document.pageSettings.size.width, 80));

  header.graphics.drawImage(
      image2,
      Rect.fromLTWH(
          0, 0, document.pageSettings.size.width, 100));







 

    final PdfPage page = document.pages.add();

final PdfPage page2 = document.pages.add();


    var responseProfile = await get(Uri.parse(imgUrl!));
    var profileImgdata = responseProfile.bodyBytes;

    //Create a bitmap object.
    PdfBitmap profileImage = PdfBitmap(profileImgdata);
    
      page.graphics.drawImage(
        profileImage,
        Rect.fromLTWH(
            0, 10, 170, 180));

  page.graphics.drawString(
          '$name',
          PdfStandardFont(PdfFontFamily.helvetica, 25,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(0, 50, 198)),
          bounds: Rect.fromPoints(Offset(200, 10), Offset(200, 10))
  );
 
  page.graphics.drawLine(
    PdfPen(PdfColor(0, 50, 198), width: 1),
    Offset(200, 40),Offset(340, 40));


  page.graphics.drawString(
          'Designation',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.regular),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(200, 50), Offset(300, 50))
  );
  page.graphics.drawString(
          '$designation',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(280, 50), Offset(500, 50))
  );


  page.graphics.drawString(
          'Employee Id',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.regular),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(200, 70), Offset(300, 70))
  );
  page.graphics.drawString(
          '$employeId',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(280, 70), Offset(500, 70))
  );


  page.graphics.drawString(
          'Email',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.regular),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(200, 90), Offset(300, 90))
  );
  page.graphics.drawString(
          '$email',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(280, 90), Offset(500, 90))
  );


  page.graphics.drawString(
          'Shift',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.regular),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(200, 110), Offset(300, 110))
  );
  page.graphics.drawString(
          '$shift',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(280, 110), Offset(500, 110))
  );



  page.graphics.drawString(
          'Shift Time',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.regular),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(200, 130), Offset(300, 130))
  );
  page.graphics.drawString(
          '$startTime - $endTime',
          PdfStandardFont(PdfFontFamily.helvetica, 12,
              style: PdfFontStyle.bold),
          brush:PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(280, 130), Offset(500, 130))
  );







  


  page.graphics.drawString(
          'Cummulative Statistics',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(0, 240), Offset(0, 240))
  );

    page.graphics.drawLine(
    PdfPen(PdfColor(58, 58, 58), width: 1),
    Offset(0, 260),Offset(140, 260));










    final PdfGraphics graphics = page.graphics;

    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(0, 270), Offset(110, 310)));

    graphics.drawString(
              'Actual Working Hours',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 280), Offset(10, 280)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
     graphics.drawString(
              '260 hours',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 295), Offset(10, 295)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );



  

    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(120, 270), Offset(230, 310)));

    graphics.drawString(
              'Paid Working Hours',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 280), Offset(130, 280)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
    graphics.drawString(
              '290 hours',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 295), Offset(130, 295)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );





    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(0, 320), Offset(110, 360)));

    graphics.drawString(
              'Total Early Arrivals',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 330), Offset(10, 330)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
    graphics.drawString(
              '10 Arrivals',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 345), Offset(10, 345)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );





  

    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(120, 320), Offset(230, 360)));


    graphics.drawString(
              'Total Late Arrivals',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 330), Offset(130, 330)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
    graphics.drawString(
              '2 Arrivals',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 345), Offset(130, 345)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );








    
    
    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(0, 370), Offset(110, 410)));

    graphics.drawString(
              'Total Offs',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 370), Offset(10, 390)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
    graphics.drawString(
              '2 off',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(10, 395), Offset(130, 395)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );



  

    graphics.drawRectangle(
  
    pen: PdfPen(PdfColor(2, 158, 222)),
    brush: PdfSolidBrush(PdfColor(2, 158, 222)),
    bounds: Rect.fromPoints(Offset(120, 370), Offset(230, 410)));

        graphics.drawString(
              'Total Leaves',
              PdfStandardFont(PdfFontFamily.helvetica, 8,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 370), Offset(130, 390)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );
    graphics.drawString(
              '2 leaves',
              PdfStandardFont(PdfFontFamily.helvetica, 12,
                  style: PdfFontStyle.bold),
              brush: PdfBrushes.white,
              bounds: Rect.fromPoints(Offset(130, 395), Offset(130, 395)),
               format: PdfStringFormat(
            alignment: PdfTextAlignment.left, lineAlignment: PdfVerticalAlignment.middle)
              // bounds: Rect.fromLTWH(50, 130, 300, 50)
      );




    


    final PdfBitmap image3 = PdfBitmap(graphData);
      page.graphics.drawImage(image3,
      Rect.fromLTWH(
          250, 240, 300, 200),     
    );



            final PdfBitmap image5 = PdfBitmap(graphData3);
      page.graphics.drawImage(image5,
      Rect.fromLTWH(
          0, 445, 285, 180),     
    );



    final PdfBitmap image4 = PdfBitmap(graphData2);
      page.graphics.drawImage(image4,
      Rect.fromLTWH(
          280, 445, 270, 180),     
    );












    PdfGrid grid = PdfGrid();
  
    //Define number of columns in table
    grid.columns.add(count: 8);
    //Add header to the grid
    grid.headers.add(1);
    
    //Add the rows to the grid
    PdfGridRow header2 = grid.headers[0];
    header2.cells[0].value = "s.no";
    header2.cells[1].value = "Date";
    header2.cells[2].value = "Act Checkin";
    header2.cells[3].value = "Act Checkout";
    header2.cells[4].value = "Checkin";
    header2.cells[5].value = "Checkout";
    header2.cells[6].value = "Working Hrs";
    header2.cells[7].value = "status";
    
    

   



    //Add header style
    PdfGridCellStyle gridcell = PdfGridCellStyle(
  borders: PdfBorders(
        left: PdfPens.black,
        right: PdfPens.black,
        top: PdfPens.black,
        bottom: PdfPens.black
      ),
  backgroundBrush: PdfBrushes.black,
  textBrush: PdfBrushes.wheat,
   font: PdfStandardFont(PdfFontFamily.helvetica, 9,style:PdfFontStyle.bold),
    );

 

 PdfGridStyle gridStyle = PdfGridStyle(
 
  cellSpacing: 1,
  cellPadding: PdfPaddings(left: 8, right: 0, top: 8, bottom: 5),
  borderOverlapStyle: PdfBorderOverlapStyle.overlap,

);
grid.headers.applyStyle(gridcell);
grid.rows.applyStyle(gridStyle);
    //Add rows to grid
    for (final customer in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = customer.serial.toString();
      row.cells[1].value = customer.date;
      row.cells[2].value = "08:00 AM";
      row.cells[3].value = "05:00 PM";
      row.cells[4].value = customer.checkin;
      row.cells[5].value = customer.checkout;
      row.cells[6].value = customer.workingHours;
      row.cells[7].value = customer.status;
      row.cells[7].style = PdfGridCellStyle(
  backgroundBrush:
   row.cells[7].value=="early"?
   PdfSolidBrush( PdfColor(9, 55, 95))
   :
   row.cells[7].value=="on Time"?
   PdfSolidBrush( PdfColor(13, 81, 139))
   :
   row.cells[7].value=="Late"?
   PdfSolidBrush( PdfColor(69, 160, 237))
   :
   PdfBrushes.white,
  textBrush: PdfBrushes.white

   
 
);
    }
    //Add rows style
   
    


  page2.graphics.drawString(
          'Attendence Record',
          PdfStandardFont(PdfFontFamily.helvetica, 14,
              style: PdfFontStyle.bold),
          brush: PdfSolidBrush(PdfColor(58, 58, 58)),
          bounds: Rect.fromPoints(Offset(0, 0), Offset(0, 0))
  );

    page2.graphics.drawLine(
    PdfPen(PdfColor(58, 58, 58), width: 1),
    Offset(0, 20),Offset(90, 20));


  //  // Draw the grid
    grid.draw(
        page: page2, bounds: const Rect.fromLTWH(0, 30, 0, 0));    





List<int> bytes = await document.save();



    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}













    class DougnutChartData {
        DougnutChartData(this.x, this.y, this.color);
            final String x;
            final int y;
            final Color color;
    }




    class ChartDataProgress {
        ChartDataProgress(this.x, this.y);
        final String x;
        final double y;
    }