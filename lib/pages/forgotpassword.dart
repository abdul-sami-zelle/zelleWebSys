import 'package:emp_sys/pages/landingPage.dart';
import 'package:emp_sys/pages/passresetpopup.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';

import '../statemanager/provider.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  final _formKey = new GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            

            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 10, 148, 223),
          Color.fromARGB(255, 182, 42, 190)
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 280, 0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // EMAIL BOX
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                                  Color.fromARGB(255, 10, 148, 223),
                                  Color.fromARGB(255, 182, 42, 190)
                                ]),
                                width: 3,
                              )),
                          child: TextFormField(
                              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                   Provider11.ResetPassword(email.text);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return popup();
                                  },
                                );
                }
              },
                            controller: email,
                            
                            validator: (value) =>
                  value!.isEmpty ? 'Email cannot be blank' : null,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: 'abc@gamil.com',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Container(
                          height: 44.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 10, 148, 223),
                                Color.fromARGB(255, 182, 42, 190)
                              ])),
                          child: ElevatedButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Provider11.ResetPassword(email.text);
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return popup();
                                  },
                                );
                              }
                              
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: const Text('Reset Password'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
