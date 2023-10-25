import 'package:emp_sys/pages/login.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarLeft extends StatelessWidget {
  const SideBarLeft({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0xff1F2123),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Column(
            children: [
              SizedBox(height: 20,),
              Image.network("https://res.cloudinary.com/diecwxxmm/image/upload/v1696918288/zellesolutions%20portal/i9ikjvb1nyv580ezkcv8.png",height: 30,width: 30,),
              SizedBox(height: 40,),
               InkWell(
                onTap: (){
                  Provider11.changeSideTab(0);
                },
                 child: Container(
                 width: double.infinity,
                 
                 decoration: BoxDecoration(
                  border:Provider11.activeTab==0? Border(
                    right: BorderSide(width: 2, color: Colors.white)
                  ):null
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/128/1828/1828791.png",color:Provider11.activeTab==0?Colors.white:Color(0xff8F95A2),height: 23,width: 23,),
                      SizedBox(height: 5,),
                      Multi(color: Provider11.activeTab==0?Colors.white:Color(0xff8F95A2), subtitle: "Dashboard", weight: FontWeight.w400, size: 2)
                    ],
                  ),
                 ),
               ),
               SizedBox(height: 40,),
               InkWell(
                onTap: (){
                  Provider11.changeSideTab(1);
                },
                 child: Container(
                             width: double.infinity,
                 
                 decoration: BoxDecoration(
                  border: Provider11.activeTab==1? Border(
                    right: BorderSide(width: 2, color: Colors.white)
                  ):null
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/128/10227/10227403.png",color: Provider11.activeTab==1?Colors.white:Color(0xff8F95A2),height: 23,width: 23,),
                      SizedBox(height: 5,),
                      Multi(color: Provider11.activeTab==1?Colors.white:Color(0xff8F95A2), subtitle: "Time Tracking", weight: FontWeight.w400, size: 2)
                    ],
                  ),
                 ),
               ),
              SizedBox(height: 40,),
                InkWell(
                onTap: (){
                  Provider11.changeSideTab(2);
                },
                 child: Container(
                 width: double.infinity,
                 
                 decoration: BoxDecoration(
                  border: Provider11.activeTab==2? Border(
                    right: BorderSide(width: 2, color: Colors.white)
                  ):null
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/128/9290/9290365.png",color: Provider11.activeTab==2?Colors.white:Color(0xff8F95A2),height: 23,width: 23,),
                      SizedBox(height: 5,),
                      Multi(color: Provider11.activeTab==2?Colors.white:Color(0xff8F95A2), subtitle: "Attendance", weight: FontWeight.w400, size: 2)
                    ],
                  ),
                 ),
               ),
                SizedBox(height: 40,),
               InkWell(
                onTap: (){
                  Provider11.changeSideTab(3);
                },
                 child: Container(
                 width: double.infinity,
                 
                 decoration: BoxDecoration(
                  border: Provider11.activeTab==3? Border(
                    right: BorderSide(width: 2, color: Colors.white)
                  ):null
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/128/2602/2602467.png",color: Provider11.activeTab==3?Colors.white:Color(0xff8F95A2),height: 23,width: 23,),
                      SizedBox(height: 5,),
                      Multi(color: Provider11.activeTab==3?Colors.white:Color(0xff8F95A2), subtitle: "Report", weight: FontWeight.w400, size: 2)
                    ],
                  ),
                 ),
               ),
                SizedBox(height: 40,),
                InkWell(
                onTap: (){
                  Provider11.changeSideTab(4);
                },
                 child:Container(
                 width: double.infinity,
                 
                 decoration: BoxDecoration(
                  border: Provider11.activeTab==4? Border(
                    right: BorderSide(width: 2, color: Colors.white)
                  ):null
                 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/128/666/666201.png",color: Provider11.activeTab==4?Colors.white:Color(0xff8F95A2),height: 23,width: 23,),
                      SizedBox(height: 5,),
                      Multi(color: Provider11.activeTab==4?Colors.white:Color(0xff8F95A2), subtitle: "Profile", weight: FontWeight.w400, size: 2)
                    ],
                  ),
                 ),
               )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: ()async{
                 await Provider11.clearProvider();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                },
                child: Container(
                     width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/128/1828/1828479.png",color:  Color(0xff8F95A2),height: 23,width: 23,),
                          SizedBox(height: 5,),
                          Multi(color:  Color(0xff8F95A2), subtitle: "Log Out", weight: FontWeight.w400, size: 0)
                        ],
                      ),
                     ),
              ),
              SizedBox(height: 20,),
            ],
          ),
              
        ],
      ),
    );
  }
}