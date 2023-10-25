import 'dart:convert';

import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/TimeTrackingEmployeGraphs/bubbleChart.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:emp_sys/widgets/multiCentered.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TimeTrakingReports extends StatelessWidget {
   TimeTrakingReports({super.key});

  @override
  List<TimeTrackingData> dataa=[];
  Future<List<TimeTrackingData>> generatedList()async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var decodedData = json.decode(response.body).cast<Map<String,dynamic>>();
     dataa = await decodedData.map<TimeTrackingData>((json)=>TimeTrackingData.fromJson(json)).toList();
    print(dataa);
    return dataa;
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Multi(color: Colors.white, subtitle: "Tracked Time Record", weight: FontWeight.bold, size: 6),
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
                                  InkWell(
                                    onTap: (){
                                      Provider11.changeTimeTrackTab(1);
                                    },
                                    child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Image.network("https://cdn-icons-png.flaticon.com/128/126/126425.png",height: 14,width: 14,color:Provider11.activeTabTimeTracked==1?Colors.white:Color(0xff8F95A2),),
                                                            SizedBox(width: 5,),
                                                            Multi(color: Provider11.activeTabTimeTracked==1?Colors.white:Color(0xff8F95A2), subtitle: "Graphical Illustration", weight: FontWeight.w500, size: 3)
                                                          ],
                                                         ),
                                  ),
                                 
                                ],
                              ),
                               Image.network("https://cdn-icons-png.flaticon.com/128/5261/5261933.png",height: 20,width: 20,color:Colors.white,)
                            ],
                          ),
                        SizedBox(height: 10,),
                        Provider11.activeTabTimeTracked==1?  BubbleChart():Container(),
                       Provider11.activeTabTimeTracked==0?FutureBuilder(
                          
                                  future: generatedList(),
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
                                        return DataTable(
                                          columnSpacing: 17,
                                          headingRowHeight: 70,
                                          columns: [
                                            
                                            DataColumn(
                                            
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "S No.", weight: FontWeight.bold, size: 3)
                                              ),
                                            DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "date", weight: FontWeight.bold, size: 3)
                                              ),
                                            DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Start Time", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "End Time", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Call Break", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Casual Break", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Lunch Break", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Namaz Break", weight: FontWeight.bold, size: 3)
                                              ),
                                              DataColumn(
                                              label: Multi(color: Color(0xff8F95A2), subtitle: "Summit Break", weight: FontWeight.bold, size: 3)
                                              ),
                                          ], 
                                          rows: dataa.map((e)=>DataRow(cells: [
                                            DataCell(MultiCentered(color: Color(0xff8F95A2), subtitle: e.serialNo.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.date.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.startShift.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.endShift.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.callBreak.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.namazBreak.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.lunchBreak.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.casualBreak.toString(), weight: FontWeight.normal, size: 3)),
                                            DataCell(Multi(color: Color(0xff8F95A2), subtitle: e.summitBreak.toString(), weight: FontWeight.normal, size: 3)),
                                          ])).toList()
                                          );
                                      }
                                    }
                        
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                              
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
        
    
    
    ElevatedButton(onPressed: (){
      generatedList();
    }, child: Text("data"));
  }
}