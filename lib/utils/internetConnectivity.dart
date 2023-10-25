import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class WifiConnectivityWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: Connectivity().onConnectivityChanged,
//       initialData: ConnectivityResult.none,
//       builder: (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
//         final connectivityResult = snapshot.data;
//         final wifiConnected = connectivityResult == ConnectivityResult.wifi;
//         return Center(
//           child: Text(
//             wifiConnected ? 'Wi-Fi is connected' : 'Wi-Fi is not connected',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



class WifiConnectivityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == ConnectivityResult.mobile) {
          return Multi(color: Colors.white, subtitle: 'Connected to mobile network', weight: FontWeight.bold, size: 2);
        } else if (snapshot.hasData &&
            snapshot.data == ConnectivityResult.wifi) {
          return Multi(color: Colors.white, subtitle: 'Connected to wifi network', weight: FontWeight.bold, size: 2);
        } else {
          return Multi(color: Colors.white, subtitle: 'Connected to no  network', weight: FontWeight.bold, size: 2);
        }
      },
    );
  }
}