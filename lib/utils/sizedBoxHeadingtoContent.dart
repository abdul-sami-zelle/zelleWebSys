import 'package:flutter/material.dart';

class SizedBoxHeadtoCont extends StatelessWidget {
  const SizedBoxHeadtoCont({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: ((size.width>801 )&&   (size.width<1920))?10:20,
    );
  }
} 