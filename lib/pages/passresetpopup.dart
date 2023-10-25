import 'package:emp_sys/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class popup extends StatelessWidget {
  const popup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 32, 35, 50),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
                  onPressed: () {
                    Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: const Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/128/1617/1617543.png'),
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  )),
        ],
      ),
      content: Container(
        height: 200,
        width: 300,
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: const Text('An email has been sent to your Email address please check.',style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: const Text('if you do not see the Email in Inbox please check your Spam Foldder',style: TextStyle(color: Colors.white,fontSize: 15),),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            
            child: Text('Ok',style: TextStyle(fontSize: 10,color: Colors.white),))
          ],
        ),
      ),
    );

  }
}
