import 'package:emp_sys/widgets/instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class leftpanel extends StatelessWidget {
  const leftpanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 0, 191, 239);
                    }
                    return const Color.fromARGB(255, 32, 35, 50);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 32, 35, 50);
                    }
                    return const Color.fromARGB(255, 207, 208, 215);
                  }),
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/2329/2329087.png',
                      height: 20.h,
                      width: 20.w,
                      color: const Color.fromARGB(255, 110, 109, 110),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 0, 191, 239);
                    }
                    return const Color.fromARGB(255, 32, 35, 50);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 32, 35, 50);
                    }
                    return const Color.fromARGB(255, 207, 208, 215);
                  }),
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/2972/2972497.png',
                      height: 20.h,
                      width: 20.w,
                      color: const Color.fromARGB(255, 110, 109, 110),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                          'Time Tracking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 0, 191, 239);
                    }
                    return const Color.fromARGB(255, 32, 35, 50);
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return const Color.fromARGB(255, 32, 35, 50);
                    }
                    return const Color.fromARGB(255, 207, 208, 215);
                  }),
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/2782/2782058.png',
                      height: 20.h,
                      width: 20.w,
                      color: const Color.fromARGB(255, 110, 109, 110),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                          'Reports',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 90, 8, 0),
            child: Container(
              height: 280.h,
              width: 350.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepOrange,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Important Instructions.',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '1. Do not close the browser window before ending your shift.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          '2. When ever leaving your laptop or computer make sure to press the start break button according to what ever reason you are leaving.',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 10, 0),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return instruction();
                              },
                            );
                          },
                          child: const Text(
                            'See more',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
          //  Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          //     child: TextButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(5))),
          //         backgroundColor:
          //             MaterialStateProperty.resolveWith<Color>(
          //                 (Set<MaterialState> states) {
          //           if (states.contains(MaterialState.hovered)) {
          //             return const Color.fromARGB(255, 255, 255, 255);
          //           }
          //           return const Color.fromARGB(255, 32, 35, 50);
          //         }),
          //         foregroundColor:
          //             MaterialStateProperty.resolveWith<Color>(
          //                 (Set<MaterialState> states) {
          //           if (states.contains(MaterialState.hovered)) {
          //             return const Color.fromARGB(255, 32, 35, 50);
          //           }
          //           return const Color.fromARGB(255, 207, 208, 215);
          //         }),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.network(
          //             'https://cdn-icons-png.flaticon.com/128/4155/4155600.png',
          //             height: 20,
          //             width: 20,
          //             color: const Color.fromARGB(255, 110, 109, 110),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
          //             child: Padding(
          //               padding: EdgeInsets.only(bottom: 7),
          //               child: Text(
          //                 'Teams',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 15,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          //  Padding(
          //   padding: const EdgeInsets.only(top: 10),
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          //     child: TextButton(
          //       onPressed: () {},
          //       style: ButtonStyle(
          //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(5))),
          //         backgroundColor:
          //             MaterialStateProperty.resolveWith<Color>(
          //                 (Set<MaterialState> states) {
          //           if (states.contains(MaterialState.hovered)) {
          //             return const Color.fromARGB(255, 255, 255, 255);
          //           }
          //           return const Color.fromARGB(255, 32, 35, 50);
          //         }),
          //         foregroundColor:
          //             MaterialStateProperty.resolveWith<Color>(
          //                 (Set<MaterialState> states) {
          //           if (states.contains(MaterialState.hovered)) {
          //             return const Color.fromARGB(255, 32, 35, 50);
          //           }
          //           return const Color.fromARGB(255, 207, 208, 215);
          //         }),
          //       ),
          //       child: Row(
          //         children: [
          //           Image.network(
          //             'https://cdn-icons-png.flaticon.com/128/2579/2579940.png',
          //             height: 20,
          //             width: 20,
          //             color: const Color.fromARGB(255, 110, 109, 110),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
          //             child: Padding(
          //               padding: EdgeInsets.only(bottom: 7),
          //               child: Text(
          //                 'Approvals',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 15,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
