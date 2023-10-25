// import 'package:emp_sys/statemanager/provider.dart';
// import 'package:emp_sys/widgets/conformation_box.dart';
// import 'package:emp_sys/widgets/instructions.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ShiftButtons extends StatelessWidget {
//   ShiftButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context);

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 50),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
//               child: Tooltip(
//                 message: 'Start Clock',
//                 child: TextButton(
//                   onPressed: () {
                    
//                     Provider11.checkData();
//                     print(Provider11.dataExist);
//                     if (Provider11.dataExist == null) {
//                       Provider11.startbuttonenabled == null
//                           ? Provider11.startbuttonenabled = true
//                           : null;
//                       Provider11.startbuttonenabled != true
//                           ? null
//                           : Provider11.isRunning == false
//                               ? Provider11.startTimer()
//                               : null;
//                       Provider11.addemployeeData();
//                     }
//                     else{}
//                   },
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5))),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.hovered)) {
//                         return Color.fromARGB(255, 0, 191, 239);
//                       }
//                       return const Color.fromARGB(255, 32, 35, 50);
//                     }),
//                     foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.hovered)) {
//                         return const Color.fromARGB(255, 32, 35, 50);
//                       }
//                       return const Color.fromARGB(255, 207, 208, 215);
//                     }),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.network(
//                         'https://cdn-icons-png.flaticon.com/128/9905/9905727.png',
//                         height: 20,
//                         width: 20,
//                         color: const Color.fromARGB(255, 110, 109, 110),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 7),
//                           child: Text(
//                             'Initiate',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
//               child: Tooltip(
//                 message: 'Close Clock',
//                 child: TextButton(
//                   onPressed: () {
//                     showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return confirm();
//                                 },
//                               );
//                     print(Provider11.startbuttonenabled);
                    
                    
                    
//                   },
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(5))),
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.hovered)) {
//                         return Color.fromARGB(255, 0, 191, 239);
//                       }
//                       return const Color.fromARGB(255, 32, 35, 50);
//                     }),
//                     foregroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.hovered)) {
//                         return const Color.fromARGB(255, 32, 35, 50);
//                       }
//                       return const Color.fromARGB(255, 207, 208, 215);
//                     }),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.network(
//                         'https://cdn-icons-png.flaticon.com/128/9905/9905727.png',
//                         height: 20,
//                         width: 20,
//                         color: const Color.fromARGB(255, 110, 109, 110),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
//                         child: Padding(
//                           padding: EdgeInsets.only(bottom: 7),
//                           child: Text(
//                             'Terminate',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
