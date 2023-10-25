import 'package:emp_sys/statemanager/provider.dart';
import 'package:emp_sys/widgets/upperTabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UpperTabs(tabFor: "Call Break", color1: Color(0xff64FDC2), duration: "${Provider11.callBreakSum.inMinutes.toString()}", img: 'assets/images/phone-call.png', active: Provider11.call_break, breakFor: '0', controller1: Provider11.call_break_controller,),
          UpperTabs(tabFor: "Namaz Break", color1: Color(0xffFFB976), duration: "${Provider11.namazBreakSum.inMinutes.toString()}", img: 'assets/images/beads.png', active: Provider11.namaz_break, breakFor: '1', controller1: Provider11.namaz_break_controller,),
          UpperTabs(tabFor: "Lunch Break", color1: Color(0xffAE8BFF), duration: "${Provider11.lunchBreakSum.inMinutes.toString()}", img:  'assets/images/breakfast.png', active: Provider11.lunch_break, breakFor: '2', controller1: Provider11.lunch_break_controller,),
          UpperTabs(tabFor: "Casual Break", color1: Color(0xff48A7FF), duration: "${Provider11.casualBreakSum.inMinutes.toString()}", img: 'assets/images/other.png', active: Provider11.casual_break, breakFor: '3', controller1: Provider11.casual_break_controller,),
          UpperTabs(tabFor: "Summit Break", color1: Color(0xff4832A2), duration: "${Provider11.summitBreakSum.inMinutes.toString()}", img: 'assets/images/star.png', active: Provider11.summit_break, breakFor: '4', controller1: Provider11.summit_break_controller,),
        ],
      ),
    );
  }
}