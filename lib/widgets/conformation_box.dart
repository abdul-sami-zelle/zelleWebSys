// import 'package:emp_sys/statemanager/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class confirm extends StatelessWidget {
//   confirm({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context, listen: true);
//     return AlertDialog(
//       backgroundColor: const Color.fromARGB(255, 32, 35, 50),
//       insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
//       title: Container(
//         height: 30,
//         width: 270,
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               top: -20,
//               right: -20,
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: const Image(
//                     image: NetworkImage(
//                         'https://cdn-icons-png.flaticon.com/128/1617/1617543.png'),
//                     height: 25,
//                     width: 25,
//                     color: Colors.white,
//                   )),
//             ),
//           ],
//         ),
//       ),
//       content: Container(
//         height: 120,
//         width: 280,
//         child: Column(
//           children: [
//             Text(
//               'Are you sure?',
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             ),
//             Text('You want to end shift?',
//                 style: TextStyle(fontSize: 15, color: Colors.white)),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Provider11.startbuttonenabled != false
//                             ? null
//                             : Provider11.resetTimer();
//                         Provider11.lastAction = null;
//                         Provider11.startbuttonenabled = null;
//                         Provider11.endShiftDataBase();
//                         Navigator.of(context).pop();
//                       },
//                       style: ButtonStyle(
//                         fixedSize: MaterialStateProperty.all<Size>(
//                           Size(
//                               100, 30), // Set your custom width and height here
//                         ),
//                       ),
//                       child: const Text('Yes'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       style: ButtonStyle(
//                         fixedSize: MaterialStateProperty.all<Size>(
//                           Size(
//                               100, 30), // Set your custom width and height here
//                         ),
//                       ),
//                       child: const Text('No'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
