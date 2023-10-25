import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventsUi extends StatelessWidget {
  String? day;
  String? date;
  String? month;
  String? time;
  String? location;
  String? imgAddress;
   EventsUi({required this.day,required this.date,required this.month,required this.time,required this.location,required this.imgAddress,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Color(0xffb929be),
                                        child:    Multi(
                            color: Colors.white,
                            subtitle: "$day",
                            weight: FontWeight.bold,
                            size: 7),
                                      ),
                        
                       Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Color(0xffb929be),
                                        child:  Multi(
                            color: Colors.white,
                            subtitle: "$date",
                            weight: FontWeight.bold,
                            size: 10),
                                      ),
                         Shimmer.fromColors(
                                        baseColor: Colors.white,
                                        highlightColor: Color(0xffb929be),
                                        child:Multi(
                            color: Colors.white,
                            subtitle: "$month",
                            weight: FontWeight.w500,
                            size: 3),
                                      ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/818/818149.png",
                              color: Colors.white,
                              height: 15,
                              width: 15,
                            ),
                            SizedBox(width: 4),
                            Multi(
                                color: Colors.white,
                                subtitle: "$time",
                                weight: FontWeight.w500,
                                size: 2.5),
                          ],
                        ),
                      
                      ],
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                           image: DecorationImage(image: NetworkImage("$imgAddress"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 50,
                        right: 50,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                             5
                            )
                          ),
                          child:   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/3179/3179068.png",
                              color: Colors.white,
                              height: 12,
                              width: 12,
                            ),
                            SizedBox(width: 5),
                            Multi(
                                color: Colors.white,
                                subtitle: "$location",
                                weight: FontWeight.w500,
                                size: 2.5),
                          ],
                        ),
                        ))
                    ],
                  )),
            ],
          ),
          Positioned(
            left: 0,
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Color(0xff0032C6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10)
                    )
                  ),
                ),
                 Container(
                  height: 40,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Color(0xff00AEE8)
                  ),
                ),
                 Container(
                  height: 40,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Color(0xffBA29BD)
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black
                  )
                ]
              ),
              child: Padding(
                padding:EdgeInsets.all(4),
                child: Image.network("https://cdn-icons-png.flaticon.com/128/2875/2875433.png",height: 20,width: 20,),
              ),
            ))
        ],
      ),
    );
  }
}
