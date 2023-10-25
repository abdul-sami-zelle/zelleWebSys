import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/utils/sizedBoxHeadingtoContent.dart';
import 'package:emp_sys/widgets/early_leave_box.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     final Provider11 = Provider.of<Provider1>(context, listen: true);
    return  Padding(
      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
           Expanded(
            flex: 5,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Multi(color: Colors.white, subtitle: "Shift Buttons", weight: FontWeight.w400, size: 4),
               ],
             ),
           ),
      // SizedBoxHeadtoCont(),
          Expanded(
            flex: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                      child: NeumorphicButton(
                    onTap: () {
                     Provider11.shiftStarted==false? Provider11.startShiftTime():null;
                    },
                    child: Container(
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/128/159/159607.png',
                            height:
                            size.width<1250?50
                            :size.width>1999?80
                            :60,
                            color: Provider11.shiftStarted==true? Color.fromARGB(255, 29, 237, 36):Colors.grey[700]!,
                          ),
                          SizedBox(height: 10,),
                          Multi(color:  Provider11.shiftStarted==true? Color.fromARGB(255, 29, 237, 36):Colors.grey[700]!, subtitle: "Shift Start", weight: FontWeight.bold, size:size.width<1250?2.5: 3)
                        ],
                      ),
                  
                    ),
                    bottomRightShadowBlurRadius: 15,
                    bottomRightShadowSpreadRadius: 1,
                    borderWidth: 5,
                    backgroundColor: Colors.grey.shade900,
                    topLeftShadowBlurRadius: 15,
                    topLeftShadowSpreadRadius: 1,
                    topLeftShadowColor: const Color.fromARGB(255, 48, 48, 48),
                    bottomRightShadowColor: Colors.black,
                                height:
                    (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    width:
                              (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    padding: EdgeInsets.only(top:5,bottom: 5),
                    bottomRightOffset: Offset(5, 5),
                    topLeftOffset: Offset(-5, -5),
                  )
                ),
                
                Center(
                      child: NeumorphicButton(
                    onTap: () async{
                    await  Provider11.endShiftTime();
                   
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/128/2/2914.png',
                              height:
                            size.width<1250?50
                            :size.width>1999?80
                            :60,
                            color: Colors.grey[700],
                          ),
                          SizedBox(height: 10,),
                          Multi(color: Colors.grey[700]!, subtitle: "Shift End", weight: FontWeight.bold, size:size.width<1250?2.5: 3)
                        ],
                      ),
                  
                    ),
                    bottomRightShadowBlurRadius: 15,
                    bottomRightShadowSpreadRadius: 1,
                    borderWidth: 5,
                    backgroundColor: Colors.grey.shade900,
                    topLeftShadowBlurRadius: 15,
                    topLeftShadowSpreadRadius: 1,
                    topLeftShadowColor: const Color.fromARGB(255, 48, 48, 48),
                    bottomRightShadowColor: Colors.black,
                                                height:
                    (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    width:
                              (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    padding: EdgeInsets.only(top:5,bottom: 5),
                    bottomRightOffset: Offset(5, 5),
                    topLeftOffset: Offset(-5, -5),
                  )
                ),
               Center(
                      child: NeumorphicButton(
                    onTap: () {
                      showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogBox();
                                },
                              );
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/128/50/50037.png',
                             height:
                            size.width<1250?50
                            :size.width>1999?80
                            :60,
                            color: Colors.grey[700],
                          ),
                          SizedBox(height: 10,),
                          Multi(color: Colors.grey[700]!, subtitle: "Early Leave", weight: FontWeight.bold, size:size.width<1250?2.5: 3)
                        ],
                      ),
                  
                    ),
                    bottomRightShadowBlurRadius: 15,
                    bottomRightShadowSpreadRadius: 1,
                    borderWidth: 5,
                    backgroundColor: Colors.grey.shade900,
                    topLeftShadowBlurRadius: 15,
                    topLeftShadowSpreadRadius: 1,
                    topLeftShadowColor: const Color.fromARGB(255, 48, 48, 48),
                    bottomRightShadowColor: Colors.black,
                                                  height:
                    (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    width:
                              (size.width < 999 && size.width > 900)
            ? 85
            :(size.width < 1119 && size.width > 1000)
            ? 95
            :(size.width < 1220 && size.width > 1120)
            ? 95
            : (size.width < 1320 && size.width > 1220)
            ? 110
            :(size.width < 1496 && size.width > 1320)
            ?120
            :(size.width > 1496 && size.width < 1731)
            ?125
            :(size.width > 1730 && size.width < 1799)
            ?130
            :(size.width < 2100 && size.width > 1799)
            ?140
            :140,
                    padding: EdgeInsets.only(top:5,bottom: 5),
                    bottomRightOffset: Offset(5, 5),
                    topLeftOffset: Offset(-5, -5),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}