import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emp_sys/statemanager/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatefulWidget {
   String tname='';
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
 
  @override
  Widget build(BuildContext context) {
    
    final Provider11 = Provider.of<Provider1>(context);
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('morning_Shift')
        .doc("${Provider11.uid}")
        .collection("2023-09-29")
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String?, dynamic> data =
                    document.data()! as Map<String?, dynamic>;
                return Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Start Time"),
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data['Break'].toList().length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      "${data['Break'].toList()[index]['startTime'].toString()}");
                                }),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("end Time"),
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data['Break'].toList().length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      "${data['Break'].toList()[index]['endTime'].toString()}");
                                }),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("duration"),
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: data['Break'].toList().length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      "${Provider11.findTimeDifference(data['Break'].toList()[index]['startTime'].toString(), data['Break'].toList()[index]['endTime'].toString())}");
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
