// import 'package:emp_sys/statemanager/provider.dart';
// import 'package:emp_sys/widgets/early_leave_box.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class breakbuttons extends StatelessWidget {
//   breakbuttons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context, listen: true);
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // break button
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 50),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'Need to attend a call',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction == null
//                             ? Provider11.lastAction = 'call break'
//                             : null;
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.lastAction != 'call break'
//                                 ? null
//                                 : Provider11.isRunning == false
//                                     ? Provider11.startTimer()
//                                     : Provider11.stopTimer();
                  
//                         Provider11.BreakDataBase();
//                         print(Provider11.lastAction);
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/159/159832.png',
//                             height: 20,
//                             width: 20,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 7),
//                               child: Provider11.lastAction == 'call break'
//                                   ? const Text(
//                                       'Resume',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Call Break',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // lunch break
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'Going to get some food',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction == null
//                             ? Provider11.lastAction = 'lunch break'
//                             : null;
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.lastAction != 'lunch break'
//                                 ? null
//                                 : Provider11.isRunning == false
//                                     ? Provider11.startTimer()
//                                     : Provider11.stopTimer();
//                         Provider11.lunchBreakDataBase();
//                         print(Provider11.lastAction);
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/12121/12121939.png',
//                             height: 25,
//                             width: 25,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 7),
//                               child: Provider11.lastAction == 'lunch break'
//                                   ? const Text(
//                                       'Resume',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Lunch Break',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // namaz break
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'Going to say prayer',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction == null
//                             ? Provider11.lastAction = 'namaz break'
//                             : null;
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.lastAction != 'namaz break'
//                                 ? null
//                                 : Provider11.isRunning == false
//                                     ? Provider11.startTimer()
//                                     : Provider11.stopTimer();
//                         Provider11.namazBreakDataBase();
//                         print(Provider11.lastAction);
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/4277/4277762.png',
//                             height: 20,
//                             width: 20,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 7),
//                               child: Provider11.lastAction == 'namaz break'
//                                   ? const Text(
//                                       'Resume',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Namaz Break',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
              
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'bathroom break',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction == null
//                             ? Provider11.lastAction = 'casual leave'
//                             : null;
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.lastAction != 'casual leave'
//                                 ? null
//                                 : Provider11.isRunning == false
//                                     ? Provider11.startTimer()
//                                     : Provider11.stopTimer();
//                         Provider11.casualLeaveDataBase();
//                         print(Provider11.lastAction);
                        
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/1828/1828427.png',
//                             height: 20,
//                             width: 20,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 7),
//                               child: Provider11.lastAction == 'casual leave'
//                                   ? const Text(
//                                       'Resume',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Casual Leave',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//              Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'Meeting with sir Osama',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction == null
//                             ? Provider11.lastAction = 'summit leave'
//                             : null;
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.lastAction != 'summit leave'
//                                 ? null
//                                 : Provider11.isRunning == false
//                                     ? Provider11.startTimer()
//                                     : Provider11.stopTimer();
//                         Provider11.summitLeaveDataBase();
//                         print(Provider11.lastAction);
                        
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/1828/1828427.png',
//                             height: 20,
//                             width: 20,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 7),
//                               child: Provider11.lastAction == 'summit leave'
//                                   ? const Text(
//                                       'Resume',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     )
//                                   : const Text(
//                                       'Summiting',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                   child: Tooltip(
//                     message: 'Ask for going home early',
//                     child: TextButton(
//                       onPressed: () {
//                         Provider11.lastAction = 'early leave';
//                         Provider11.lastAction != 'early leave'
//                             ? null
//                             : showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return DialogBox();
//                                 },
//                               );
                        
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5))),
//                         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return Color.fromARGB(255, 0, 191, 239);
//                           }
//                           return const Color.fromARGB(255, 32, 35, 50);
//                         }),
//                         foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.hovered)) {
//                             return const Color.fromARGB(255, 32, 35, 50);
//                           }
//                           return const Color.fromARGB(255, 207, 208, 215);
//                         }),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             'https://cdn-icons-png.flaticon.com/128/1828/1828427.png',
//                             height: 20,
//                             width: 20,
//                             color: const Color.fromARGB(255, 110, 109, 110),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 7),
//                               child: Text(
//                                 'Early Leave',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
