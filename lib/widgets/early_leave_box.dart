import 'package:emp_sys/statemanager/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBox extends StatelessWidget {
  DialogBox({Key? key});

  @override
  TextEditingController reason = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 32, 35, 50),
      insetPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Your reason',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Image(
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/128/1617/1617543.png'),
                height: 25,
                width: 25,
                color: Colors.white,
              ))
        ],
      ),
      content: Container(
        height: 150,
        width: 270,
        child: Column(
          children: [
            Form(
              key:_formKey ,
              child: TextFormField(
                 validator: (value) =>
                  value!.isEmpty ? 'Reason cannot be blank' : null,
              // onSaved: (value) => _email = value,
            
              controller: reason,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 255, 255, 255)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500),
                hintText: 'Enter text...',
              ),
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: ElevatedButton(
                onPressed: () async{
                 if (_formKey.currentState!.validate()) {
                await  Provider11.endShiftTimeEarly(reason.text);
                 Navigator.of(context).pop();
                 }
                },
                child: const Text('Enter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
