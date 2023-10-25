// import 'package:emp_sys/statemanager/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class clock extends StatelessWidget {
//   const clock({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context);
    

//     return  Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Column(
//         //crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             //crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(50, 40, 40, 40),
//                     child: Text(
//                       (Provider11.timeInSec.inSeconds ~/ 3600).toString().padLeft(2, '0'),
//                       style: const TextStyle(
//                         height: 0.5,
//                         fontFamily: 'digital',
//                         fontSize: 250,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(40),
//                     child: Text(
//                       'Hours',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 50, 0, 100),
//                     child: Text(
//                       ':',
//                       style: TextStyle(
//                           fontSize: 150,
//                           color: Color.fromARGB(255, 255, 255, 255)),
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding:  EdgeInsets.all(40),
//                     child: Text(
//                      ((Provider11.timeInSec.inSeconds % 3600) ~/ 60).toString().padLeft(2, '0'),
//                       style: const TextStyle(
//                         height: 0.5,
//                         fontFamily: 'digital',
//                         fontSize: 250,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(40),
//                     child: Text(
//                       'Minutes',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(0, 50, 0, 100),
//                 child: Row(
//                   children: [
//                     Text(
//                       ':',
//                       style: TextStyle(
//                           fontSize: 150,
//                           color: Color.fromARGB(255, 255, 255, 255)),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(40),
//                     child: Text(
//                       (Provider11.timeInSec.inSeconds % 60).toString().padLeft(2, '0'),
//                       style: const TextStyle(
//                         height: 0.5,
//                         fontFamily: 'digital',
//                         fontSize: 250,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(40),
//                     child: Text(
//                       'Seconds',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
