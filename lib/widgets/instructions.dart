import 'package:emp_sys/statemanager/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class instruction extends StatelessWidget {
  instruction({Key? key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 32, 35, 50),
      insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      title: Container(
        height: 30,
        width: 270,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/128/1617/1617543.png'),
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
      content: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Instructions',style: TextStyle(fontSize: 25, color: Colors.white),),
            const Text(
              'Initaite to start the clock.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const Text(
              'Terminate to end the clock.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const Text(
              'Call Break for any personal work.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const Text(
              'Lunch break for going to get lunch.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const Text(
              'Namaz Break for when going to pray.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            
            Text(
              'Summit break for going to a meeting with Sir Osama.',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size(
                              100, 30), // Set your custom width and height here
                        ),
                      ),
                      child: const Text('Ok'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
