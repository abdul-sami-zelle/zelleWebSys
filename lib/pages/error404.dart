import 'package:flutter/material.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
          Color.fromARGB(255, 10, 148, 223),
          Color.fromARGB(255, 182, 42, 190)
        ])
        ),
        child: const Center(
          child: Column(
            children: [
              Text('404'),
              Text('The Page you requested was not found'),
            ],
          ),
        ),
      ),
    );
  }
}
