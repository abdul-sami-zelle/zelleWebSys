import 'dart:convert';

import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/TimeTrackingEmployeGraphs/bubbleChart.dart';
import 'package:emp_sys/widgets/attendanceChart.dart';
import 'package:emp_sys/widgets/attendenceDataBox.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:emp_sys/widgets/multiCentered.dart';
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





class AttendanceData extends StatefulWidget {
   AttendanceData({super.key});

  @override
  State<AttendanceData> createState() => _AttendanceDataState();
}

class _AttendanceDataState extends State<AttendanceData> {
  @override
  
 ScrollController _scrollController = ScrollController();


List<AttendanceChartData1> graphData = [];
List<Timings> attendanceDataPdf = [];





String _selectedValue =  DateFormat('MMMM yyyy').format(DateTime.now());











String? statusCategorization(String dailyArrival, String actualArrivalTime ) {


  String arrivalCategory = categorizeArrival(actualArrivalTime, dailyArrival);
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

List<int>? imgGraph;


   Future<List?> _renderChartAsImage() async {
  final double pixelRatio = 2.0; // Try using a lower pixel ratio (e.g., 2.0)
  final ui.Image data = await _cartesianChartKey.currentState!.toImage(pixelRatio: pixelRatio);
  final ByteData? bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List imageBytes = bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  imgGraph=imageBytes;
  print(imgGraph);
  return imageBytes;
}



List<double> lateArrival = [];

List<double> onTimemArrival = [];

List<double> late15min = [];

int index = 0; 

var attenData = [];

var attenDates = [];

late GlobalKey<SfCartesianChartState> _cartesianChartKey;







  Widget build(BuildContext context) {
    _cartesianChartKey = GlobalKey();
    final size = MediaQuery.of(context).size;
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    Future fetchFireBaseData()async{
         attenData = [];
 lateArrival = [];
index = 0; 
 onTimemArrival = [];

 late15min = [];
   attenDates = [];
  final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('attendence/${_selectedValue}/${Provider11.shift_}').get();
if (snapshot.exists) {
  final Map<String, dynamic> data = snapshot.value as Map<String, dynamic>;

    // Initialize an empty Map to store the data for the specified UID
    final Map<String, dynamic> uidData = {};
    
    // Specify the UID you want to retrieve
    final desiredUid = Provider11.uid;

    // Loop through the data and extract data for the desired UID
    data.forEach((date, dateData) {
      if (dateData.containsKey(desiredUid)) {
        index++;
       
        uidData[date] = dateData[desiredUid];
       
        print(uidData[date]['checkin'].toString());
        uidData[date]['checkin']==null?index--:graphData.add(AttendanceChartData1(x: date, y:statusCategorization(uidData[date]['checkin'],Provider11.in_.toString()), early: onTimemArrival[index-1], late: lateArrival[index-1], late15:late15min[index-1]));
      }
    });
    print("${uidData} data is herere");

    final Map<String, dynamic> finalData = Provider11.sorting(uidData);
    for (var i = 0; i < finalData.length; i++) {
      print("${finalData.keys.toList()[i]} ---> ${i}");
        attendanceDataPdf.add(Timings(checkin:finalData.values.toList()[i]['checkin']==null?"null":finalData.values.toList()[i]['checkin'], checkout:finalData.values.toList()[i]['checkout']==null?"null":finalData.values.toList()[i]['checkout'], date:finalData.keys.toList()[i].toString(), workingHours:finalData.values.toList()[i]['checkin']==null||finalData.values.toList()[i]['checkout']==null?"nil": Provider11.getTimeDifference(finalData.values.toList()[i]['checkin'].toString(),finalData.values.toList()[i]['checkout'].toString()), status:finalData.values.toList()[i]['checkin']==null?"nil": Provider11.statusCategorization2(finalData.values.toList()[i]['checkin'].toString())));

    }
    // Print the extracted data for the specified UID
    attenData=finalData.values.toList();
    attenDates = finalData.keys.toList();
    print(lateArrival);
    print(onTimemArrival);
    print(late15min);

    for (var i = 0; i < graphData.length; i++) {
      print("${graphData[i].early}  ${graphData[i].late}  ${graphData[i].late15}");
    }

   
    
} else {
    print('No data available.');
}





return attenData;
}
    return  Scrollbar(
      child: ListView(
        primary: true,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Multi(color: Colors.white, subtitle: "Attendance Record", weight: FontWeight.bold, size: 6),
                                              Container()
                                            ],
                                           ),
          ),
                                
                        SizedBox(height: 25,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              
                                             decoration: BoxDecoration(
                                      color: Color(0xff1F2123),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:EdgeInsets.only(top:20,left:25,right: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Image.network("https://cdn-icons-png.flaticon.com/128/25/25617.png",height: 14,width: 14,color:Provider11.activeTabTimeTracked==0?Colors.white: Color(0xff8F95A2),),
                                                            SizedBox(width: 5,),
                                                            Multi(color: Provider11.activeTabTimeTracked==0?Colors.white:Color(0xff8F95A2), subtitle: "Table View", weight: FontWeight.w500, size: 3)
                                                          ],
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
                                     await _renderChartAsImage();
                                      PdfService().printCustomersPdf(attendanceDataPdf,imgGraph);
                                    },
                                    child: Image.network("https://cdn-icons-png.flaticon.com/128/5261/5261933.png",height: 20,width: 20,color:Colors.white,)),
                                 ],
                               )
                            ],
                          ),
                         
                        SizedBox(height: 10,),
                        Provider11.activeTabTimeTracked==0?                             Padding(
                          padding:EdgeInsets.only(bottom: 20),
                          child: FutureBuilder(
                                
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
                                              final data = snapshot.data;
                                              return  ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4
                                            ,crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                            childAspectRatio:3
                                                  
                                            ),
                                          itemCount: attenData.length,
                                          itemBuilder: (BuildContext context, int index) {
                                         
                                            return  GestureDetector(
                                                  onTap: (){
                                             
                                                  },
                                                  child: AttendenceBox(checkin: attenData[index]['checkin'].toString(), checkout: attenData[index]['checkout'].toString(), hours: 
                                  ((attenData[index]['checkin'].toString()=="null") || (attenData[index]['checkout'].toString()=="null"))?  "null":  Provider11.getTimeDifference(attenData[index]['checkin'].toString(),attenData[index]['checkout'].toString()), dates: attenDates[index].toString(), status:attenData[index]['checkin'].toString()=="null"?"null": Provider11.statusCategorization(attenData[index]['checkin'].toString()).toString(),)
                                            );
                                          },
                                        ),
                                        SizedBox(height: 40,),
                                        InkWell(
                                    onTap: (){
                                      Provider11.changeTimeTrackTab(1);
                                    },
                                    child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Image.network("https://cdn-icons-png.flaticon.com/128/126/126425.png",height: 14,width: 14,color:Colors.white),
                                                            SizedBox(width: 5,),
                                                            Multi(color:Colors.white, subtitle: "Graphical Illustration", weight: FontWeight.w500, size: 3)
                                                          ],
                                                         ),
                                  ),
                                  SizedBox(height: 30,),
                                         Container(
            height: 400,
            child: Column(
              children: [
                SfCartesianChart(
                  key: _cartesianChartKey,
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      //Hide the gridlines of x-axis
                      majorGridLines: MajorGridLines(width: 0),
                      //Hide the axis line of x-axis
                      axisLine: AxisLine(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                        //Hide the gridlines of y-axis
                        majorGridLines: MajorGridLines(width: 0),
                        //Hide the axis line of y-axis
                        axisLine: AxisLine(width: 0)),
                    enableAxisAnimation: true,
                    backgroundColor: Color(0xff1F2123),
                    series: <ChartSeries>[
                      BubbleSeries<AttendanceChartData1, String>(
                          dataSource: graphData,
                          color: Colors.amber,
                          sizeValueMapper: (AttendanceChartData1 data, _) => data.early,
                          xValueMapper: (AttendanceChartData1 data, _) => data.x,
                          yValueMapper: (AttendanceChartData1 data, _) => data.early),
                      BubbleSeries<AttendanceChartData1, String>(
                          dataSource: graphData,
                          color: Colors.red,
                          sizeValueMapper: (AttendanceChartData1 data, _) => data.late,
                          xValueMapper: (AttendanceChartData1 data, _) => data.x,
                          yValueMapper: (AttendanceChartData1 data, _) => data.late),
                      BubbleSeries<AttendanceChartData1, String>(
                          dataSource: graphData,
                          color: Colors.green,
                          sizeValueMapper: (AttendanceChartData1 data, _) => data.late15,
                          xValueMapper: (AttendanceChartData1 data, _) => data.x,
                          yValueMapper: (AttendanceChartData1 data, _) => data.late15),
                    
                    ]),
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
    AttendanceChartLegends(legendColor: Colors.red, legendName: "Late Arrival"),
    AttendanceChartLegends(legendColor: Colors.green, legendName: "On Time"),
    AttendanceChartLegends(legendColor: Colors.amber, legendName: "Early Arrival"),
  ],
),
                )
              ],
            ))
                                                ],
                                              );
                                            }
                                          }
                              
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                    
                              ),
                        ):Container(),
                     

                     
              
              
                  
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
        
    
    
   
  }
}


class AttendanceChartData1 {
  var x;
  String? y;
  double? early;
  double? late;
  double? late15;
  AttendanceChartData1({required this.x,required this.y,required this.early,required this.late,required this.late15});
}


class ChartData {
        ChartData(this.x,this.x2,this.x3, this.y);
        final int x;
        final int x2;
        final int x3;
        final double? y;

    }
class Timings{
      String? date;
  String? checkin;
  String? checkout;
  String? workingHours;
  String? status;
  
  Timings({
    required this.date,
    required this.checkin,
    required this.checkout,
    required this.workingHours,
    required this.status
    });
}



class PdfService {
  Future<void> printCustomersPdf(List<Timings> data,var graphData) async {


//Create a new pdf document
PdfDocument document = PdfDocument();

 document.pageSettings.margins.all = 5;
// Define margins (left, top, right, bottom) with reduced values
final EdgeInsetsGeometry reducedMargins = EdgeInsets.fromLTRB(10, 10, 10, 10);

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







  final PdfBitmap image3 = PdfBitmap(graphData);

    final PdfPage page = document.pages.add();


       page.graphics.drawImage(
           image3,
      Rect.fromLTWH(
          0, 0, document.pageSettings.size.width/1.2, 300),
         
          );





      




















//     //Create a new PDF document
//     PdfDocument document = PdfDocument();



    PdfGrid grid = PdfGrid();
    



    
    //Define number of columns in table
    grid.columns.add(count: 5);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header2 = grid.headers[0];
    header2.cells[0].value = "date";
    header2.cells[1].value = "checkin";
    header2.cells[2].value = "checkout";
    header2.cells[3].value = "working hr";
    header2.cells[4].value = "status";
    
    





    //Add header style
    header2.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );



    //Add rows to grid
    for (final customer in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = customer.date;
      row.cells[1].value = customer.checkin;
      row.cells[2].value = customer.checkout;
      row.cells[3].value = customer.workingHours;
      row.cells[4].value = customer.status;
      row.cells[4].style = PdfGridCellStyle(
  backgroundBrush: row.cells[4].value=="early"?PdfBrushes.yellow:PdfBrushes.white,
  textPen:  row.cells[4].value=="early"?PdfPens.white:PdfPens.black,
   font: PdfStandardFont(PdfFontFamily.timesRoman, 10),
   
 
);
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 15, right: 15, top: 4, bottom: 5),
      
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );
    
    //Draw the grid
    grid.draw(
        page: page, bounds: const Rect.fromLTWH(0, 500, 0, 0));    





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




