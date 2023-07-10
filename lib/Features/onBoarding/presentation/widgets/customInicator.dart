import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';


class customIndicator extends StatelessWidget{
  @override
  final int points;
  const customIndicator({super.key, required this.points});

  Widget build(BuildContext context) {
   return Positioned(
     left: 10,
     right: 10,
     bottom:MediaQuery.of(context).size.height * .3,
     child: DotsIndicator(
       decorator: DotsDecorator(
         color: Colors.transparent ,
         activeColor: KMainColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(5),
           side: BorderSide(color: KMainColor),
         ),
       ),
       dotsCount: 3,
       position: points,
     ),
   );
  }

}