import 'package:emp_sys/pages/landingPage.dart';
import 'package:emp_sys/pages/login.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/utils/internetConnectivity.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class cappbar extends StatelessWidget {
  const cappbar({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
           SizedBox(height: 8,),
          Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Color(0xff009ae2),
                                        highlightColor: Color(0xffb929be),
                                        child: Multi(
                                            color: Colors.white,
                                            subtitle: "Zelle      ",
                                            weight: FontWeight.w700,
                                            size: 4),
                                      ),
                                      Shimmer.fromColors(
                                        baseColor: Color(0xff009ae2),
                                        highlightColor: Color(0xffb929be),
                                        child: Multi(
                                            color: Colors.white,
                                            subtitle: "Solutions",
                                            weight: FontWeight.w700,
                                            size: 4),
                                      ),
                                    ],
                                  ),
                                  ),
                               
                                  Row(
                                        children: [
                                         
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.network(
                                                'https://cdn-icons-png.flaticon.com/128/5337/5337129.png',
                                                color: Color(0xff8F95A2),
                                                height: 20,
                                                width: 20,
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Image.network(
                                                'https://cdn-icons-png.flaticon.com/128/3953/3953226.png',
                                                color: Color(0xff8F95A2),
                                                height: 20,
                                                width: 20,
                                              )),
                                          Container(
                                            width: 50,
                                            child: PopupMenuButton(
                                              icon: const CircleAvatar(
                                                backgroundImage: NetworkImage(
                                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                                                backgroundColor: Color.fromARGB(255, 253, 252, 252),
                                              ),
                                              itemBuilder: (BuildContext context) {
                                                return [
                                  const PopupMenuItem<String>(
                                    value: '1',
                                    child: Text('1'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: '2',
                                    child: Text('2'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: '3',
                                    child: Text('3'),
                                  ),
                                                ];
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                ],
                              ),
        ],
      ),
    );
  }
}
